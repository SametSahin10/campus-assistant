// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indoor_location_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndoorLocationEdge _$IndoorLocationEdgeFromJson(Map<String, dynamic> json) =>
    IndoorLocationEdge(
      id: json['id'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      direction: $enumDecode(_$DirectionEnumMap, json['direction']),
      weight: (json['weight'] as num).toInt(),
    );

Map<String, dynamic> _$IndoorLocationEdgeToJson(IndoorLocationEdge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'weight': instance.weight,
    };

const _$DirectionEnumMap = {
  Direction.right: 'right',
  Direction.left: 'left',
  Direction.up: 'up',
  Direction.down: 'down',
};
