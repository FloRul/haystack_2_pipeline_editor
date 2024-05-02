import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';

class NodeUI {
  final String id;
  final Offset position;
  final SocketUI? input;
  final SocketUI? output;

  NodeUI._({
    required this.id,
    required this.position,
    this.input,
    this.output,
  });

  factory NodeUI({
    required String nodeId,
    required Offset position,
    SocketUI? input,
    SocketUI? output,
  }) {
    return NodeUI._(
      id: nodeId,
      position: position,
      input: input,
      output: output,
    );
  }

  NodeUI copyWith({
    String? nodeId,
    Offset? position,
    SocketUI? input,
    SocketUI? output,
  }) {
    return NodeUI(
      nodeId: nodeId ?? id,
      position: position ?? this.position,
      input: input ?? this.input,
      output: output ?? this.output,
    );
  }
}

class SocketUI {
  // the position of the socket relative to the node position
  final Offset nodeOffset;
  final NodeUI node;
  final SocketType type;

  SocketUI({
    required this.nodeOffset,
    required this.node,
    required this.type,
  });

  String get id => '${node.id}_${type.name}';
  Offset get position => node.position + nodeOffset;

  @override
  String toString() {
    return 'SocketUI{id: $id, nodeOffset: $nodeOffset, node: ${node.id}, type: $type}';
  }

  SocketUI copyWith({
    Offset? nodeOffset,
    NodeUI? node,
    SocketType? type,
  }) {
    return SocketUI(
      nodeOffset: nodeOffset ?? this.nodeOffset,
      node: node ?? this.node,
      type: type ?? this.type,
    );
  }

  static bool areCompatible(SocketUI from, SocketUI to) {
    return from.type != to.type && from.node.id != to.node.id;
  }
}

class ConnectionUI {
  final SocketUI from;
  final SocketUI to;

  ConnectionUI({
    required this.from,
    required this.to,
  });

  ConnectionUI copyWith({
    SocketUI? from,
    SocketUI? to,
  }) {
    return ConnectionUI(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}
