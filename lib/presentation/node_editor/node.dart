import 'package:flutter/material.dart';

class Node {
  final String id;
  final Offset position;

  Node({required this.id, required this.position});

  Node copyWith({
    String? id,
    Offset? position,
  }) {
    return Node(
      id: id ?? this.id,
      position: position ?? this.position,
    );
  }
}

class Connection {
  final String sourceNodeId;
  final String destinationNodeId;

  Connection({
    required this.sourceNodeId,
    required this.destinationNodeId,
  });
}
