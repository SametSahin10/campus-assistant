import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';
import 'package:campus_assistant/features/indoor_navigation/models/shortest_path.dart';
import 'package:campus_assistant/features/indoor_navigation/state/indoor_navigation_model.dart';
import 'package:campus_assistant/repositories/indoor_location_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'indoor_navigation_notifier.g.dart';

@riverpod
class IndoorNavigationNotifier extends _$IndoorNavigationNotifier {
  @override
  IndoorNavigationModel build() {
    return IndoorNavigationModel.initial();
  }

  void getIndoorLocationGraph() async {
    state = state.copyWith(gettingIndoorLocationGraph: true);

    final indoorLocationRepository = IndoorLocationRepository();
    final graph = await indoorLocationRepository.getEngineeringFacultyGraph();

    state = state.copyWith(
      indoorLocationGraph: graph,
      gettingIndoorLocationGraph: false,
    );
  }

  void setNextIndoorLocation(IndoorLocationVertex? nextIndoorLocation) {
    state = state.copyWith(nextIndoorLocation: nextIndoorLocation);
  }

  void setShortestPath(ShortestPath shortestPath) {
    state = state.copyWith(shortestPath: shortestPath);
  }

  void markNextIndoorLocationAsArrived() {
    final shortestPath = state.shortestPath;
    final nextIndoorLocation = state.nextIndoorLocation;
    if (shortestPath == null || nextIndoorLocation == null) return;

    if (nextIndoorLocation == state.destination) {
      state = state.copyWith(nextIndoorLocation: null);
      return;
    }

    final verticesInPath = shortestPath.verticesInPath;
    final nextIndoorLocationIndex = verticesInPath.indexOf(nextIndoorLocation);

    state = state.copyWith(
      nextIndoorLocation: verticesInPath[nextIndoorLocationIndex + 1],
    );
  }

  void setOrigin(IndoorLocationVertex origin) {
    state = state.copyWith(origin: origin);
  }

  void setDestination(IndoorLocationVertex destination) {
    state = state.copyWith(destination: destination);
  }
}
