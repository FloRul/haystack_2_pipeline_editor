class NodeUI {
  final String nodeId;
  final double dx;
  final double dy;

  NodeUI({
    required this.nodeId,
    required this.dx,
    required this.dy,
  });

  NodeUI copyWith({required double dx, required double dy}) {
    return NodeUI(
      nodeId: nodeId,
      dx: dx,
      dy: dy,
    );
  }
}

class SocketUI {
  final String nodeId;
  final String socketId;
  final double dx;
  final double dy;

  SocketUI({
    required this.nodeId,
    required this.socketId,
    required this.dx,
    required this.dy,
  });
}
