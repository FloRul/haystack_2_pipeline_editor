import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';

class ConnectionPainter extends CustomPainter {
  final List<Node> nodes;
  final List<Connection> connections;
  final Offset translationOffset;

  ConnectionPainter({
    required this.nodes,
    required this.connections,
    required this.translationOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(translationOffset.dx, translationOffset.dy);
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    var path = Path();

    for (var connection in connections) {
      var sourceNode = nodes.firstWhere((node) => node.id == connection.sourceNodeId);
      var destinationNode = nodes.firstWhere((node) => node.id == connection.destinationNodeId);
      path.reset();
      path.moveTo(sourceNode.position.dx, sourceNode.position.dy);
      path.quadraticBezierTo(destinationNode.position.dx, destinationNode.position.dy, destinationNode.position.dx,
          destinationNode.position.dy);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
