class Node {
  final String id;

  Node({
    required this.id,
  });
}

class Connection {
  final String sourceNodeId;
  final String destinationNodeId;

  Connection({
    required this.sourceNodeId,
    required this.destinationNodeId,
  });
}
