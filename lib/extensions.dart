import 'package:campus_assistant/enums.dart';
import 'package:flutter/material.dart';

extension ScreenSizes on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}

extension DirectionExtension on Direction {
  String toDescription() {
    switch (this) {
      case Direction.up:
        return 'Yukarı kata çık';
      case Direction.down:
        return 'Aşağı kata in';
      case Direction.left:
        return 'Sola dön';
      case Direction.right:
        return 'Sağa dön';
      default:
        return '';
    }
  }
}
