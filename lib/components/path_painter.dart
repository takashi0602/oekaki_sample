import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  PathPainter(this.path);

  final Path path;

  final _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = Colors.black
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) {
    return true;
  }
}
