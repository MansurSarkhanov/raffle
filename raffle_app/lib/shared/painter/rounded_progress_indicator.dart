import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MyBorderPainter extends CustomPainter {
  MyBorderPainter({required this.progress, required this.borderColor, this.strokeWdth});
  double progress; // desirable value for corners side
  double? strokeWdth;
  Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    double x = min(size.height, size.width);
    double x2 = x / 2;
    double x4 = x / 4;

    Paint paintt = Paint()
      ..color = progress == 0 ? Colors.transparent : borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWdth ?? 4.0;
    // ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(x2, x)
      ..lineTo(x4, x)
      ..quadraticBezierTo(0, x, 0, x - x4)
      ..lineTo(0, x4)
      ..quadraticBezierTo(0, 0, x4, 0)
      ..lineTo(x - x4, 0)
      ..quadraticBezierTo(x, 0, x, x4)
      ..lineTo(x, x - x4)
      ..quadraticBezierTo(x, x, x - x4, x)
      ..lineTo(x2, x);

    PathMetric pathMetric = path.computeMetrics().first;

    Path extractPath =
        pathMetric.extractPath(pathMetric.length * (0.5 * (1 - progress)), pathMetric.length * (0.5 + 0.5 * progress));
    canvas.drawPath(extractPath, paintt);
  }

  @override
  bool shouldRepaint(covariant MyBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
