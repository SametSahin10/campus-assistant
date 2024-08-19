import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/extensions.dart';
import 'package:campus_assistant/features/find_shortest_path.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_notifier.dart';
import 'package:campus_assistant/navigation/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartIndoorNavigationButton extends ConsumerWidget {
  const StartIndoorNavigationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: context.width * 0.9,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        ),
        icon: Image.asset(Assets.goToLocation, scale: 3.8),
        label: Container(
          width: context.width * 0.7,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 24),
          child: const Text(
            'Git',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () {
          final indoorNavigationModel =
              ref.read(indoorNavigationNotifierProvider);

          final origin = indoorNavigationModel.origin;
          final destination = indoorNavigationModel.destination;
          final graph = indoorNavigationModel.indoorLocationGraph;

          if (origin == null || destination == null || graph == null) return;

          final shortestPathFinder = ShortestPathFinder(
            origin: origin,
            destination: destination,
            graph: graph,
          );

          final shortestPath = shortestPathFinder.findShortestPath();
          debugPrint("Shortest path: $shortestPath");

          final verticesInPath = shortestPath.verticesInPath;

          final nextVertex =
              verticesInPath.length == 1 ? null : verticesInPath[1];

          final indoorNavigationNotifier =
              ref.read(indoorNavigationNotifierProvider.notifier);

          indoorNavigationNotifier.setShortestPath(shortestPath);
          indoorNavigationNotifier.setNextIndoorLocation(nextVertex);

          context.router.push(
            IndoorNavigationRoute(shortestPath: shortestPath),
          );
        },
      ),
    );
  }
}
