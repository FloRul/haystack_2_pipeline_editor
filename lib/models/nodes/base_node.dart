import 'dart:convert';

import 'package:haystack_2_pipeline_editor/models/exceptions.dart';

abstract class BaseNode {
  final String name;
  final Map<String, dynamic>? inputParams;

  String get nodeType => runtimeType.toString().toLowerCase();
  String get id => '${nodeType}_${name}_$hashCode';

  BaseNode({
    required this.name,
    this.inputParams,
  });

  String serialize() {
    try {
      return jsonEncode({
        'name': name,
        'type': nodeType,
        'inputParams': jsonEncode(inputParams),
      });
    } catch (e) {
      throw SerializationException('Failed to serialize node: $e');
    }
  }

  static BaseNode deserialize(String data) {
    return jsonDecode(data);
  }
}

enum SocketType {
  input,
  output,
}

class Connection {
  final NodeSocket from;
  final NodeSocket to;

  Connection({
    required this.from,
    required this.to,
  });
}

class NodeSocket {
  final String id;
  final SocketType type;
  final BaseNode node;

  NodeSocket({
    required this.id,
    required this.type,
    required this.node,
  });
}
