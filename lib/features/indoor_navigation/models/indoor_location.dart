import 'package:campus_assistant/features/indoor_navigation/models/location_neighbour.dart';

class IndoorLocation {
  final String id;
  final String name;
  final int floor;
  final List<LocationNeighbour> neighbours;

  const IndoorLocation({
    required this.id,
    required this.name,
    required this.floor,
    required this.neighbours,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndoorLocation &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
