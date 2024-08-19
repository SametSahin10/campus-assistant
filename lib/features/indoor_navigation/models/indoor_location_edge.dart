import 'package:campus_assistant/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'indoor_location_edge.g.dart';

@JsonSerializable()
class IndoorLocationEdge {
  final String id;
  final String origin;
  final String destination;
  final Direction direction;
  final int weight;

  const IndoorLocationEdge({
    required this.id,
    required this.origin,
    required this.destination,
    required this.direction,
    required this.weight,
  });

  factory IndoorLocationEdge.fromJson(Map<String, dynamic> json) =>
      _$IndoorLocationEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$IndoorLocationEdgeToJson(this);
}
