import 'dart:math';

import 'package:campus_assistant/features/outdoor_navigation/models/bounding_box.dart';

List<int> nms(List<BoundingBox> boxes, {double threshold = 0.5}) {
  List<int> selectedIndices = [];

  List<int> sortedIndices = List.generate(boxes.length, (index) => index);

  sortedIndices.sort((a, b) =>
      boxes[b].confidenceScores[0].compareTo(boxes[a].confidenceScores[0]));

  while (sortedIndices.isNotEmpty) {
    int i = sortedIndices.removeLast();
    selectedIndices.add(i);

    List<int> newSortedIndices = [];
    for (int idx = 0; idx < sortedIndices.length; idx++) {
      int j = sortedIndices[idx];
      if (intersectionOverUnion(boxes[i], boxes[j]) <= threshold) {
        newSortedIndices.add(j);
      }
    }
    sortedIndices = newSortedIndices;
  }

  return selectedIndices;
}

double intersectionOverUnion(BoundingBox box1, BoundingBox box2) {
  double x1 = max(box1.x, box2.x);
  double y1 = max(box1.y, box2.y);
  double x2 = min(box1.x + box1.width, box2.x + box2.width);
  double y2 = min(box1.y + box1.height, box2.y + box2.height);

  double intersectionArea = max(0, x2 - x1) * max(0, y2 - y1);

  double box1Area = box1.width * box1.height;
  double box2Area = box2.width * box2.height;
  double unionArea = box1Area + box2Area - intersectionArea;

  return intersectionArea / unionArea;
}
