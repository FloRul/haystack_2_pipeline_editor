import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/editor_view.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node_widget.dart';

class DraggableNode extends StatelessWidget {
  final ValueNotifier<Node> vnode;
  final Function(DraggableDetails) onDragEnd;
  final Function() onDragStart;
  final Function(String) onConnectionStart;
  final Function(String, String) onConnectionEnd;
  final ValueNotifier<DraggingType> draggingType;

  const DraggableNode({
    required this.vnode,
    required this.onDragEnd,
    required this.onDragStart,
    required this.onConnectionStart,
    required this.onConnectionEnd,
    required this.draggingType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable(
      hitTestBehavior: HitTestBehavior.deferToChild,
      childWhenDragging: Container(),
      feedback: Material(
        child: NodeWidget(
          draggingType: draggingType,
          node: vnode.value,
          onConnectionStart: onConnectionStart,
          onConnectionEnd: onConnectionEnd,
        ),
      ),
      onDragEnd: onDragEnd,
      onDragStarted: onDragStart,
      child: NodeWidget(
        draggingType: draggingType,
        node: vnode.value,
        onConnectionStart: onConnectionStart,
        onConnectionEnd: onConnectionEnd,
      ),
    );
  }
}
