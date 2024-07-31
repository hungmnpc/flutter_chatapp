import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomAnimateBorder extends CustomPainter {
  final double animationPercent; // 0.0 to 1.0
  late Color? color;
  CustomAnimateBorder(this.animationPercent, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = 2;
    paint.color = color ?? const Color(0xFF376AED);
    paint.style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2);

    path.lineTo(0, 15);
    path.quadraticBezierTo(0, 0, 15, 0);
    path.lineTo(size.width - 15, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 15);
    path.lineTo(size.width, size.height / 2);

    var path2 = Path();
    path2.moveTo(0, size.height / 2);

    path2.lineTo(0, size.height - 15);
    path2.quadraticBezierTo(0, size.height, 15, size.height);
    path2.lineTo(size.width - 15, size.height);
    path2.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 15);
    path2.lineTo(size.width, size.height / 2);

    final p1 = Utils.createAnimatedPath(path, animationPercent);
    final p2 = Utils.createAnimatedPath(path2, animationPercent);

    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
