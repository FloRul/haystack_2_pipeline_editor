class NodeUI {
  final String nodeId;
  final double dx;
  final double dy;
  final SocketUI input;
  final SocketUI output;

  NodeUI({
    required this.nodeId,
    required this.dx,
    required this.dy,
    required this.input,
    required this.output,
  });

  NodeUI copyWith({required double dx, required double dy}) {
    return NodeUI(
      nodeId: nodeId,
      input: input,
      output: output,
      dx: dx,
      dy: dy,
    );
  }
}

class SocketUI {
  final String nodeId;
  final String id;
  final double dx;
  final double dy;

  SocketUI({
    required this.nodeId,
    required this.id,
    required this.dx,
    required this.dy,
  });
}

class ConnectionUI {
  final SocketUI input;
  final SocketUI output;

  ConnectionUI({
    required this.input,
    required this.output,
  });
}
