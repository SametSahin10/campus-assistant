import 'dart:ui' as ui;
import 'package:campus_assistant/ml_model_classes.dart';
import 'package:flutter/material.dart';
import 'package:campus_assistant/features/outdoor_navigation/models/bounding_box.dart';
import 'package:google_fonts/google_fonts.dart';

class BoundingBoxPainter extends CustomPainter {
  final ui.Image image;
  final List<BoundingBox> boxes;

  BoundingBoxPainter({required this.image, required this.boxes});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the image onto the canvas
    canvas.drawImage(image, Offset.zero, Paint());

    // Draw each bounding box onto the canvas
    for (var box in boxes) {
      canvas.drawRect(
        Rect.fromCenter(
          center: ui.Offset(box.x, box.y),
          width: box.width,
          height: box.height,
        ),
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );

      // Create a ParagraphStyle
      final textStyle = ui.ParagraphStyle(
        fontSize: 20.0,
        fontFamily: GoogleFonts.redHatDisplay().fontFamily,
      );

      final maxConfidenceScore = box.confidenceScores
          .reduce((current, next) => current > next ? current : next);

      final indexOfClass = box.confidenceScores.indexOf(maxConfidenceScore);
      final className = MLModelClasses.convertIntToClass(indexOfClass);

      // Create a ParagraphBuilder and add text to it
      final paragraphBuilder = ui.ParagraphBuilder(textStyle)
        ..addText(className);

      // Build the Paragraph
      final paragraph = paragraphBuilder.build()
        ..layout(
          ui.ParagraphConstraints(width: box.width),
        );

      // Draw the Paragraph on the canvas, positioned below the rectangle
      canvas.drawParagraph(
        paragraph,
        Offset(
          box.x,
          box.y + box.height / 2 + 15,
        ), // Adjust the offset as needed
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
