import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_notifier.dart';
import 'package:campus_assistant/navigation/routes.dart';
import 'package:campus_assistant/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: _Title(),
              ),
              Expanded(
                child: _NavigationButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Kampüs Asistanı",
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _NavigationButtons extends ConsumerWidget {
  const _NavigationButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        HomeButton(
          label: "İç Mekan Tarifi",
          iconPath: Assets.indoorNavigation,
          onPressed: () {
            final indoorNavigationNotifier =
                ref.watch(indoorNavigationNotifierProvider.notifier);
            indoorNavigationNotifier.getIndoorLocationGraph();

            context.router.push(const StartIndoorNavigationRoute());
          },
        ),
        const SizedBox(height: 12),
        HomeButton(
          label: "Dış Mekan Tarifi",
          iconPath: Assets.outdoorNavigation,
          onPressed: () {
            context.router.push(
              const OutdoorNavigationRoute(),
            );
          },
        ),
      ],
    );
  }
}
