import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/extensions.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';
import 'package:campus_assistant/features/indoor_navigation/show_you_reached_your_destination_dialog.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_notifier.dart';
import 'package:campus_assistant/features/indoor_navigation/widgets/mark_as_arrived_dropdown_button.dart';
import 'package:campus_assistant/navigation/routes.gr.dart';
import 'package:campus_assistant/services/sound_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:collection/collection.dart';

class IndoorNavigationStep extends ConsumerWidget {
  final IndoorLocationVertex vertex;
  final bool isNextStep;

  const IndoorNavigationStep({
    super.key,
    required this.vertex,
    this.isNextStep = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Image.asset(Assets.navigationStep, scale: isNextStep ? 2.2 : 3.8),
        const SizedBox(width: 12),
        isNextStep
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _NextStepText(),
                  _VertexName(vertex: vertex, isNextStep: isNextStep)
                ],
              )
            : _VertexName(vertex: vertex, isNextStep: isNextStep),
        isNextStep ? const Spacer() : const SizedBox(),
        isNextStep ? const _ScanQrAndPopupMenuButtons() : const SizedBox(),
      ],
    );
  }
}

class _NextStepText extends StatelessWidget {
  const _NextStepText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Bir sonraki adım",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _VertexName extends StatelessWidget {
  const _VertexName({required this.vertex, required this.isNextStep});

  final IndoorLocationVertex vertex;
  final bool isNextStep;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.4,
      child: AutoSizeText(
        vertex.name,
        style: TextStyle(
          fontSize: isNextStep ? 36 : 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ScanQrAndPopupMenuButtons extends ConsumerWidget {
  const _ScanQrAndPopupMenuButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final router = context.router;

            final barcodeCapture = await router.push<BarcodeCapture>(
              const QrCodeScannerRoute(),
            );

            if (barcodeCapture == null) return;

            final indoorLocationId = barcodeCapture.barcodes.first.rawValue;

            final indoorNavModel = ref.read(indoorNavigationNotifierProvider);
            final shortestPath = indoorNavModel.shortestPath!;

            final vertex = shortestPath.verticesInPath.firstWhereOrNull(
              (element) => element.id == indoorLocationId,
            );

            if (vertex == null) return;

            _playSuccessSound();

            if (indoorNavModel.nextIndoorLocation ==
                indoorNavModel.destination) {
              await showYouReachedYourDestinationDialog(context);

              router.maybePop();
            }

            final indoorNavNotifier =
                ref.read(indoorNavigationNotifierProvider.notifier);
            indoorNavNotifier.markNextIndoorLocationAsArrived();
          },
          icon: Image.asset(
            Assets.scanQrCode,
            scale: 3.2,
            color: Colors.black,
          ),
        ),
        MarkAsArrivedPopupMenuButton(
          onTap: () async {
            _playSuccessSound();

            final router = context.router;

            final indoorNavModel = ref.read(indoorNavigationNotifierProvider);

            if (indoorNavModel.nextIndoorLocation ==
                indoorNavModel.destination) {
              await showYouReachedYourDestinationDialog(context);

              router.maybePop();
            }

            final indoorNavNotifier =
                ref.read(indoorNavigationNotifierProvider.notifier);
            indoorNavNotifier.markNextIndoorLocationAsArrived();
          },
        )
      ],
    );
  }

  Future<void> _playSuccessSound() async {
    final soundService = SoundService();

    final successSound = await rootBundle.load(Assets.successSound);
    final successSoundInBytes = successSound.buffer.asUint8List();

    await soundService.playSound(
      sound: successSoundInBytes,
      whenFinished: () {
        soundService.stopPlayerAndCloseSession();
      },
    );
  }
}
