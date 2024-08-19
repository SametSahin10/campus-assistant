import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_graph.dart';
import 'package:campus_assistant/features/indoor_navigation/models/shortest_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';

part 'indoor_navigation_model.freezed.dart';

@freezed
class IndoorNavigationModel with _$IndoorNavigationModel {
  const factory IndoorNavigationModel({
    IndoorLocationVertex? origin,
    IndoorLocationVertex? destination,
    IndoorLocationGraph? indoorLocationGraph,
    @Default(false) bool gettingIndoorLocationGraph,
    ShortestPath? shortestPath,
    IndoorLocationVertex? nextIndoorLocation,
  }) = _IndoorNavigationModel;

  factory IndoorNavigationModel.initial() {
    return const IndoorNavigationModel(gettingIndoorLocationGraph: false);
  }
}
