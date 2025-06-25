import 'dart:math' as math;

import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

class ArchWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = imageackground;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * .7),
        width: size.width,
        height: size.height,
      ),
      0,
      math.pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
