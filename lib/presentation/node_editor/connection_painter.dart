import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/nodes.dart';

class ConnectionPainter extends CustomPainter {
  ConnectionPainter({
    required this.connections,
    required this.translationOffset,
  });

  final List<ConnectionUI> connections;
  final Offset translationOffset;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(
      translationOffset.dx,
      translationOffset.dy,
    );
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;

    for (var connection in connections) {
      var path = Path();

      // Move the path to the output socket's position
      path.moveTo(connection.output.dx, connection.output.dy);

      // Calculate the control points for the bezier curve
      var controlPointX = (connection.output.dx + connection.input.dx) / 2;
      var controlPointY = (connection.output.dy + connection.input.dy) / 2;

      // Create a quadratic bezier curve from the output socket to the input socket
      path.quadraticBezierTo(
        controlPointX,
        controlPointY,
        connection.input.dx,
        connection.input.dy,
      );

      // Draw the path on the canvas
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
