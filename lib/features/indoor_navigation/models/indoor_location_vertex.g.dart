// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indoor_location_vertex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndoorLocationVertex _$IndoorLocationVertexFromJson(
        Map<String, dynamic> json) =>
    IndoorLocationVertex(
      id: json['id'] as String,
      name: json['name'] as String,
      floor: (json['floor'] as num).toInt(),
    );

Map<String, dynamic> _$IndoorLocationVertexToJson(
        IndoorLocationVertex instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'floor': instance.floor,
    };
