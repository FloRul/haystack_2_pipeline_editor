import 'package:flutter/material.dart';

class BackgroundGridPainter extends CustomPainter {
  BackgroundGridPainter({required this.translationOffset});

  final Offset translationOffset;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(translationOffset.dx, translationOffset.dy);
    var paint = Paint()
      ..color = Colors.grey[200]!
      ..strokeWidth = 1;

    for (var i = 0; i < size.width; i += 10) {
      canvas.drawLine(Offset(i.toDouble(), 0), Offset(i.toDouble(), size.height), paint);
    }

    for (var i = 0; i < size.height; i += 10) {
      canvas.drawLine(Offset(0, i.toDouble()), Offset(size.width, i.toDouble()), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
