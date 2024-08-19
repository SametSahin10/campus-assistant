import 'package:campus_assistant/features/indoor_navigation/models/indoor_location.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_edge.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_graph.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';
import 'package:campus_assistant/features/indoor_navigation/models/shortest_path.dart';
import 'package:flutter/material.dart';

class ShortestPathFinder {
  final IndoorLocationVertex origin;
  final IndoorLocationVertex destination;
  final IndoorLocationGraph graph;

  const ShortestPathFinder({
    required this.origin,
    required this.destination,
    required this.graph,
  });

  static const floorDiffPenalty = 10;

  /// Finds the shortest path between two [IndoorLocation]s using A* algorithm.
  ShortestPath findShortestPath() {
    final evaluatedVertices = <String>[];
    final List<IndoorLocationVertex> verticesInPath = [origin];
    final List<IndoorLocationEdge> edgesInPath = [];

    if (origin == destination) {
      return ShortestPath(
        verticesInPath: verticesInPath,
        edgesInPath: edgesInPath,
      );
    }

    IndoorLocationVertex currentVertex = origin;

    while (verticesInPath.last != destination) {
      final edgesToCheck = graph.edges.where((edge) {
        final destinationAlreadyEvaluated =
            evaluatedVertices.contains(edge.destination);
        return !destinationAlreadyEvaluated && edge.origin == currentVertex.id;
      }).toList();

      final firstEdge = edgesToCheck.first;

      String idOfNeighbourWithLowestCost = firstEdge.destination;
      final destinationVertex = _findVertexById(firstEdge.destination);

      int lowestCost = _calculateCostBetweenVertices(
        origin: currentVertex,
        destination: destinationVertex,
        edge: firstEdge,
      );

      // No need to check the first edge again
      // since it's considered to be the lowest cost at first
      for (int i = 1; i < edgesToCheck.length; i++) {
        final edge = edgesToCheck[i];
        final destinationVertex = _findVertexById(edge.destination);

        final cost = _calculateCostBetweenVertices(
          origin: currentVertex,
          destination: destinationVertex,
          edge: edge,
        );

        if (cost < lowestCost) {
          lowestCost = cost;
          idOfNeighbourWithLowestCost = edge.destination;
        }
      }

      final neighbourWithLowestCost =
          _findVertexById(idOfNeighbourWithLowestCost);

      final chosenEdge = graph.edges.firstWhere(
        (edge) {
          return edge.origin == currentVertex.id &&
              edge.destination == idOfNeighbourWithLowestCost;
        },
      );

      debugPrint("Adding ${neighbourWithLowestCost.name} to verticesInPath");

      verticesInPath.add(neighbourWithLowestCost);
      edgesInPath.add(chosenEdge);
      evaluatedVertices.add(currentVertex.id);

      currentVertex = neighbourWithLowestCost;
    }

    return ShortestPath(
      verticesInPath: verticesInPath,
      edgesInPath: edgesInPath,
    );
  }

  int _calculateCostBetweenVertices({
    required IndoorLocationVertex origin,
    required IndoorLocationVertex destination,
    required IndoorLocationEdge edge,
  }) {
    final heuristicCost = _calculateHeuristicCost(origin, destination);
    final actualCost = edge.weight;
    return actualCost + heuristicCost;
  }

  int _calculateHeuristicCost(
    IndoorLocationVertex origin,
    IndoorLocationVertex destination,
  ) {
    final floorDiff = origin.floor - destination.floor;
    final absoluteFloorDiff = floorDiff.abs();
    return absoluteFloorDiff * floorDiffPenalty;
  }

  IndoorLocationVertex _findVertexById(String id) {
    return graph.vertices.firstWhere((vertex) => vertex.id == id);
  }
}
