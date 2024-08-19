import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_notifier.dart';
import 'package:campus_assistant/navigation/routes.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodeButton extends ConsumerWidget {
  const ScanQrCodeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      icon: Image.asset(Assets.scanQrCode, scale: 3.2),
      label: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text(
          'QR Okut',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      onPressed: () async {
        final barcodeCapture = await context.router.push<BarcodeCapture>(
          const QrCodeScannerRoute(),
        );

        if (barcodeCapture == null) return;

        final indoorLocationId = barcodeCapture.barcodes.first.rawValue;
        final indoorNavModel = ref.read(indoorNavigationNotifierProvider);
        final vertices = indoorNavModel.indoorLocationGraph?.vertices;

        if (vertices == null) return;

        final vertex = vertices.firstWhereOrNull(
          (element) => element.id == indoorLocationId,
        );

        if (vertex == null) return;

        final indoorNavNotifier =
            ref.watch(indoorNavigationNotifierProvider.notifier);

        indoorNavNotifier.setOrigin(vertex);
      },
    );
  }
}
