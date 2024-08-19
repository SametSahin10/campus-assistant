import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/extensions.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_edge.dart';
import 'package:campus_assistant/features/indoor_navigation/models/shortest_path.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_notifier.dart';
import 'package:campus_assistant/features/indoor_navigation/widgets/indoor_navigation_step.dart';
import 'package:campus_assistant/widgets/app_bar_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class IndoorNavigationScreen extends StatelessWidget {
  final ShortestPath shortestPath;

  const IndoorNavigationScreen({super.key, required this.shortestPath});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        child: _IndoorNavigationScreenBody(shortestPath: shortestPath),
      ),
    );
  }
}

class _IndoorNavigationScreenBody extends ConsumerWidget {
  final ShortestPath shortestPath;

  const _IndoorNavigationScreenBody({required this.shortestPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationSteps = _createNavigationSteps(ref);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: const Text(
              "Başla",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          ...navigationSteps,
        ],
      ),
    );
  }

  List<Widget> _createNavigationSteps(WidgetRef ref) {
    final navigationSteps = <Widget>[];

    final verticesInPath = shortestPath.verticesInPath;
    final edgesInPath = shortestPath.edgesInPath;

    final indoorNavigationModel = ref.watch(indoorNavigationNotifierProvider);
    final nextIndoorLocation = indoorNavigationModel.nextIndoorLocation;

    for (int i = 0; i < verticesInPath.length; i++) {
      final vertex = verticesInPath[i];

      final navigationStep = IndoorNavigationStep(
        vertex: vertex,
        isNextStep: vertex == nextIndoorLocation,
      );

      if (i == verticesInPath.length - 1) {
        navigationSteps.add(navigationStep);
      } else {
        navigationSteps.add(
          Column(
            children: [
              navigationStep,
              _LocationStepConnector(
                indoorLocationEdge: edgesInPath[i],
              ),
            ],
          ),
        );
      }
    }

    return navigationSteps;
  }
}

class _LocationStepConnector extends StatelessWidget {
  final IndoorLocationEdge indoorLocationEdge;

  const _LocationStepConnector({required this.indoorLocationEdge});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.only(left: 18),
          child: Image.asset(
            Assets.terminalToDestinationArrow,
            scale: 2,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              indoorLocationEdge.direction.toDescription(),
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Uzaklık: ${indoorLocationEdge.weight} metre",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
