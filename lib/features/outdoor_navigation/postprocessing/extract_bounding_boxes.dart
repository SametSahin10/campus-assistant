import 'package:campus_assistant/features/outdoor_navigation/models/bounding_box.dart';

List<BoundingBox> extractBoundingBoxes(List<List<double>> output) {
  List<BoundingBox> boundingBoxes = [];

  for (int i = 0; i < output[0].length; i++) {
    // Denormalize the bounding box coordinates by multiplying them by 320
    double x = output[0][i] * 320;
    double y = output[1][i] * 320;
    double width = output[2][i] * 320;
    double height = output[3][i] * 320;

    List<double> confidenceScores =
        output.sublist(4).map((row) => row[i]).toList();

    boundingBoxes.add(
      BoundingBox(
        x: x,
        y: y,
        width: width,
        height: height,
        confidenceScores: confidenceScores,
      ),
    );
  }

  return boundingBoxes;
}
