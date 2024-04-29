import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node_widget.dart';

class DraggableNode extends StatelessWidget {
  final ValueNotifier<Node> vnode;
  final Function(DraggableDetails) onDragEnd;
  final Function() onDragStart;
  final Function(String) onConnectionStart;
  final Function(String, String) onConnectionEnd;

  const DraggableNode({
    required this.vnode,
    required this.onDragEnd,
    required this.onDragStart,
    required this.onConnectionStart,
    required this.onConnectionEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable(
      childWhenDragging: Container(),
      feedback: Material(
        child: SizedBox(
          width: 100,
          height: 80,
          child: NodeWidget(
            node: vnode.value,
            onConnectionStart: onConnectionStart,
            onConnectionEnd: onConnectionEnd,
          ),
        ),
      ),
      onDragEnd: onDragEnd,
      onDragStarted: onDragStart,
      child: SizedBox(
        width: 100,
        height: 80,
        child: NodeWidget(
          node: vnode.value,
          onConnectionStart: onConnectionStart,
          onConnectionEnd: onConnectionEnd,
        ),
      ),
    );
  }
}
