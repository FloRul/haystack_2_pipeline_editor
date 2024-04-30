﻿import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';

class ConnectionPainter extends CustomPainter {
  final List<(Node, Offset)> nodes;
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
      ..color = Colors.black
      ..strokeWidth = 4;

    var path = Path();

    for (var connection in connections) {
      var sourceNode = nodes.firstWhere((node) => node.$1.id == connection.sourceNodeId);
      var destinationNode = nodes.firstWhere(
        (node) => node.$1.id == connection.destinationNodeId,
      );
      path.reset();
      path.moveTo(sourceNode.$2.dx, sourceNode.$2.dy);
      path.quadraticBezierTo(
        destinationNode.$2.dx,
        destinationNode.$2.dy,
        destinationNode.$2.dx,
        destinationNode.$2.dy,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
