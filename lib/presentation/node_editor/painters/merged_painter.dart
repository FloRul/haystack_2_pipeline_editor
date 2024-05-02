import 'package:flutter/material.dart';

class CombinedPainter extends CustomPainter {
  final CustomPainter firstPainter;
  final CustomPainter secondPainter;

  CombinedPainter({required this.firstPainter, required this.secondPainter});

  @override
  void paint(Canvas canvas, Size size) {
    firstPainter.paint(canvas, size);
    secondPainter.paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
