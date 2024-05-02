import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/nodes.dart';

class ConnectionPainter extends CustomPainter {
  ConnectionPainter({
    required this.connections,
  });

  final List<ConnectionUI> connections;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;

    for (var connection in connections) {
      canvas.drawLine(
        connection.from.position,
        connection.to.position,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ConnectionPainter oldDelegate) {
    return true;
  }
}
