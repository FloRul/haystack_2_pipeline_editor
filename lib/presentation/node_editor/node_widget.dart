import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/editor_view.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/knob.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';

class NodeWidget extends StatelessWidget {
  const NodeWidget({
    super.key,
    required this.node,
    required this.onConnectionStart,
    required this.onConnectionEnd,
    required this.draggingType,
  });

  final Node node;
  final Function(String) onConnectionStart;
  final Function(String, String) onConnectionEnd;
  final ValueNotifier<DraggingType> draggingType;

  final knobSize = 20.0;

  final double width = 100;
  final double height = 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Text(
              node.id,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            left: -knobSize / 2,
            top: height / 2 - knobSize / 2,
            child: Knob(
              draggingType: draggingType,
              key: ValueKey('${node.id}_input'),
              color: Colors.red,
              duration: const Duration(milliseconds: 50),
              knobSize: knobSize,
              onConnectionStart: onConnectionStart,
              onConnectionEnd: onConnectionEnd,
            ),
          ),
          Positioned(
            right: -knobSize / 2,
            top: height / 2 - knobSize / 2,
            child: Knob(
              draggingType: draggingType,
              key: ValueKey('${node.id}_output'),
              color: Colors.green,
              duration: const Duration(milliseconds: 50),
              knobSize: knobSize,
              onConnectionStart: onConnectionStart,
              onConnectionEnd: onConnectionEnd,
            ),
          ),
        ],
      ),
    );
  }
}
