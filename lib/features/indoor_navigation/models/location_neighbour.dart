import 'package:campus_assistant/enums.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location.dart';

class LocationNeighbour {
  final IndoorLocation location;
  final Direction direction;
  final int weight;

  const LocationNeighbour({
    required this.location,
    required this.direction,
    required this.weight,
  });
}
