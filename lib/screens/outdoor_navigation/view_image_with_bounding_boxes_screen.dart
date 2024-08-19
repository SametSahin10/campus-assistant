import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/features/outdoor_navigation/bounding_box_painter.dart';
import 'package:campus_assistant/features/outdoor_navigation/models/bounding_box.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewImageWithBoundingBoxesScreen extends StatelessWidget {
  final ui.Image image;
  final List<BoundingBox> boundingBoxes;

  const ViewImageWithBoundingBoxesScreen({
    super.key,
    required this.image,
    required this.boundingBoxes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Image'),
      ),
      body: CustomPaint(
        painter: BoundingBoxPainter(
          image: image,
          boxes: boundingBoxes,
        ),
      ),
    );
  }
}
