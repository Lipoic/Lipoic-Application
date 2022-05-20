import 'dart:math';

import 'package:flutter/material.dart';

class PainterUtil {
  /// Rotate the canvas by [dx], [dy] and [angle].
  static void rotate(Canvas canvas, double dx, double dy, double angle) {
    final r = sqrt(dx * dx + dy * dy) / 2;
    final alpha = atan(dx / dy);
    final beta = alpha + angle;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = dx / 2 - shiftX;
    final translateY = dy / 2 - shiftY;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);
  }
}
