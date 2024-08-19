import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_edge.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';

class ShortestPath {
  final List<IndoorLocationVertex> verticesInPath;
  final List<IndoorLocationEdge> edgesInPath;

  const ShortestPath({
    required this.verticesInPath,
    required this.edgesInPath,
  });
}
