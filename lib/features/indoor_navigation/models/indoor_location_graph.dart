import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_edge.dart';

class IndoorLocationGraph {
  final List<IndoorLocationVertex> vertices;
  final List<IndoorLocationEdge> edges;

  const IndoorLocationGraph({required this.vertices, required this.edges});
}
