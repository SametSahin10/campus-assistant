import 'dart:typed_data';

import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/features/outdoor_navigation/models/bounding_box.dart';

import 'package:campus_assistant/features/outdoor_navigation/postprocessing/extract_bounding_boxes.dart';
import 'package:campus_assistant/features/outdoor_navigation/postprocessing/nms.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class OutdoorLocationInferenceService {
  final double confidenceThreshold;

  OutdoorLocationInferenceService({this.confidenceThreshold = 0.5});

  Future<List<BoundingBox>> runInference(Uint8List image) async {
    final normalizedImage = _preprocessImage(image);

    final output = List.filled(1 * 16 * 2100, 0).reshape([1, 16, 2100]);

    final interpreter = await Interpreter.fromAsset(
      Assets.campusAssistantMLModel,
    );

    interpreter.run(normalizedImage, output);

    final boundingBoxes = extractBoundingBoxes(output[0]);

    final filteredBoxes = _filterBoundingBoxesByThreshold(boundingBoxes);
    final selectedBoxes = _applyNms(filteredBoxes);
    selectedBoxes.sort(_byAreaDesc);

    return selectedBoxes;
  }

  int _byAreaDesc(firstBox, secondBox) {
    final firstBoxArea = firstBox.width * firstBox.height;
    final secondBoxArea = secondBox.width * secondBox.height;
    return secondBoxArea.compareTo(firstBoxArea);
  }

  List<BoundingBox> _applyNms(List<BoundingBox> filteredBoxes) {
    final nmsIndices = nms(filteredBoxes, threshold: confidenceThreshold);

    // Get selected bounding boxes
    List<BoundingBox> selectedBoxes = [];

    for (int index in nmsIndices) {
      selectedBoxes.add(filteredBoxes[index]);
    }

    return selectedBoxes;
  }

  List<BoundingBox> _filterBoundingBoxesByThreshold(
    List<BoundingBox> boundingBoxes,
  ) {
    List<BoundingBox> filteredBoxes = [];

    for (int i = 0; i < boundingBoxes.length; i++) {
      bool aboveThreshold = boundingBoxes[i]
          .confidenceScores
          .any((score) => score >= confidenceThreshold);

      if (aboveThreshold) filteredBoxes.add(boundingBoxes[i]);
    }

    return filteredBoxes;
  }

  List<dynamic> _preprocessImage(Uint8List image) {
    final decodedImage = img.decodeImage(image);
    final resizedImage = img.copyResize(decodedImage!, width: 320, height: 320);
    final imageInBytes = resizedImage.getBytes(order: img.ChannelOrder.rgb);

    final normalizedImage = imageInBytes
        .map((pixel) => pixel / 255.0)
        .toList()
        .reshape([1, 320, 320, 3]);

    return normalizedImage;
  }
}
