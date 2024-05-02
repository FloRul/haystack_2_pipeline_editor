import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';

class NodeUI {
  final String id;
  final Offset position;

  NodeUI._({
    required this.id,
    required this.position,
  });

  factory NodeUI({
    required String nodeId,
    required Offset position,
  }) {
    return NodeUI._(
      id: nodeId,
      position: position,
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
    );
  }
}

class SocketUI {
  // the position of the socket relative to the node position
  final Offset nodeOffset;
  final String nodeId;
  final SocketType type;

  SocketUI({
    required this.nodeOffset,
    required this.nodeId,
    required this.type,
  });

  String get id => '${nodeId}_${type.name}';
  Offset getPosition(Offset nodePosition) => nodePosition + nodeOffset;

  @override
  String toString() {
    return 'SocketUI{id: $id, nodeOffset: $nodeOffset, node: $nodeId, type: $type}';
  }

  SocketUI copyWith({
    Offset? nodeOffset,
    String? nodeId,
    SocketType? type,
  }) {
    return SocketUI(
      nodeOffset: nodeOffset ?? this.nodeOffset,
      nodeId: nodeId ?? this.nodeId,
      type: type ?? this.type,
    );
  }

  static bool areCompatible(SocketUI from, SocketUI to) {
    return from.type != to.type && from.nodeId != to.nodeId;
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
