import 'package:json_annotation/json_annotation.dart';

part 'indoor_location_vertex.g.dart';

@JsonSerializable()
class IndoorLocationVertex {
  final String id;
  final String name;
  final int floor;

  const IndoorLocationVertex({
    required this.id,
    required this.name,
    required this.floor,
  });

  factory IndoorLocationVertex.fromJson(Map<String, dynamic> json) =>
      _$IndoorLocationVertexFromJson(json);

  Map<String, dynamic> toJson() => _$IndoorLocationVertexToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndoorLocationVertex &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
