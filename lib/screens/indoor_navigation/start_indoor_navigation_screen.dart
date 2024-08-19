import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_notifier.dart';
import 'package:campus_assistant/features/indoor_navigation/widgets/location_dropdown.dart';
import 'package:campus_assistant/features/indoor_navigation/widgets/scan_qr_button.dart';
import 'package:campus_assistant/features/indoor_navigation/widgets/start_indoor_navigation_button.dart';
import 'package:campus_assistant/widgets/app_bar_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StartIndoorNavigationScreen extends StatelessWidget {
  const StartIndoorNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 42,
        title: const Text(
          'İç Mekan Tarifi',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: AppBarBackButton(),
        ),
      ),
      body: const _StartIndoorNavigationScreenBody(),
    );
  }
}

class _StartIndoorNavigationScreenBody extends ConsumerWidget {
  const _StartIndoorNavigationScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indoorNavigationModel = ref.watch(indoorNavigationNotifierProvider);

    final origin = indoorNavigationModel.origin;
    final destination = indoorNavigationModel.destination;
    final graph = indoorNavigationModel.indoorLocationGraph;

    if (indoorNavigationModel.gettingIndoorLocationGraph || graph == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Center(
      child: Column(
        children: [
          const ScanQrCodeButton(),
          const SizedBox(height: 40),
          const _DescriptorText(text: "veya"),
          const SizedBox(height: 40),
          const _DescriptorText(text: "Elle seç"),
          const SizedBox(height: 10),
          LocationDropdown(
            hint: "Başlangıç noktası",
            locations: graph.vertices,
            selectedLocation: origin,
            onChanged: (location) {
              if (location == null) return;

              final indoorNavNotifier =
                  ref.watch(indoorNavigationNotifierProvider.notifier);

              indoorNavNotifier.setOrigin(location);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image.asset(
              Assets.terminalToDestinationArrow,
              scale: 1.5,
            ),
          ),
          LocationDropdown(
            hint: "Varış noktası",
            locations: graph.vertices,
            selectedLocation: destination,
            onChanged: (location) {
              if (location == null) return;

              final indoorNavNotifier =
                  ref.watch(indoorNavigationNotifierProvider.notifier);

              indoorNavNotifier.setDestination(location);
            },
          ),
          const Spacer(),
          const StartIndoorNavigationButton(),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

class _DescriptorText extends StatelessWidget {
  final String text;

  const _DescriptorText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
