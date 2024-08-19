import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_graph.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_edge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IndoorLocationRepository {
  Future<IndoorLocationGraph> getEngineeringFacultyGraph() async {
    final kocaeliUniversityLocationPackageColRef = FirebaseFirestore.instance
        .collection("locationPackages")
        .doc("44mexoODmrG0DBTilgK0");

    final engineeringFacultyDocRef = kocaeliUniversityLocationPackageColRef
        .collection("locations")
        .doc("8DhC6wCcxagjH7xhjUlI");

    final vertices = engineeringFacultyDocRef
        .collection("vertices")
        .withConverter<IndoorLocationVertex>(
          fromFirestore: (docSnapshot, _) {
            final docData = docSnapshot.data()!;
            return IndoorLocationVertex.fromJson(docData);
          },
          toFirestore: (model, _) => model.toJson(),
        );

    final edges = engineeringFacultyDocRef
        .collection("edges")
        .withConverter<IndoorLocationEdge>(
          fromFirestore: (docSnapshot, _) {
            final docData = docSnapshot.data()!;
            return IndoorLocationEdge.fromJson(docData);
          },
          toFirestore: (model, _) => model.toJson(),
        );

    final verticesQuerySnapshot = await vertices.get();
    final edgesQuerySnapshot = await edges.get();

    final indoorLocationVertices =
        verticesQuerySnapshot.docs.map((e) => e.data()).toList();

    final indoorLocationEdges =
        edgesQuerySnapshot.docs.map((e) => e.data()).toList();

    return IndoorLocationGraph(
      vertices: indoorLocationVertices,
      edges: indoorLocationEdges,
    );
  }
}
