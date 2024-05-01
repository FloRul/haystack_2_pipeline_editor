import 'package:flutter/material.dart';

class BackgroundGridPainter extends CustomPainter {
  BackgroundGridPainter({
    required this.translationOffset,
    required this.maxGridSize,
  });

  final Offset translationOffset;
  final double maxGridSize;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(translationOffset.dx, translationOffset.dy);
    var paint = Paint()
      ..color = Colors.red[200]!
      ..strokeWidth = 1;

    for (var i = 0; i < maxGridSize; i += 10) {
      canvas.drawLine(Offset(i.toDouble(), 0), Offset(i.toDouble(), maxGridSize), paint);
    }

    for (var i = 0; i < maxGridSize; i += 10) {
      canvas.drawLine(Offset(0, i.toDouble()), Offset(maxGridSize, i.toDouble()), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
