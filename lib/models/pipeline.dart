import 'dart:convert';

import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/null_node.dart';

class Pipeline {
  final String name;
  final List<BaseNode> nodes;
  final List<Connection> connections;

  Pipeline({
    required this.name,
    required this.nodes,
    required this.connections,
  });

  String serialize() {
    return jsonEncode({
      'name': name,
      'nodes': nodes.map((node) => node.serialize()).toList(),
      'connections': connections
          .map((connection) => {
                'from': connection.from.id,
                'to': connection.to.id,
              })
          .toList(),
    });
  }

  static Pipeline deserialize(String data) {
    return Pipeline(
      name: 'Pipeline',
      nodes: [
        NullNode(
          name: 'Null Node',
        ),
      ],
      connections: [],
    );
  }
}
