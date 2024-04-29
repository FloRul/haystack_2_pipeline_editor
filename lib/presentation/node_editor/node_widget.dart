import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/knob.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';

class NodeWidget extends StatelessWidget {
  const NodeWidget({
    super.key,
    required this.node,
    required this.onConnectionStart,
    required this.onConnectionEnd,
  });

  final Node node;
  final Function(String) onConnectionStart;
  final Function(String, String) onConnectionEnd;
  final size = 100.0;
  final knobSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final halfHeight = constraints.maxHeight / 2;
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -knobSize / 2,
                top: halfHeight - knobSize / 2,
                child: Knob(
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
                top: halfHeight - knobSize / 2,
                child: Knob(
                  key: ValueKey('${node.id}_output'),
                  color: Colors.green,
                  duration: const Duration(milliseconds: 50),
                  knobSize: knobSize,
                  onConnectionStart: onConnectionStart,
                  onConnectionEnd: onConnectionEnd,
                ),
              ),
              Center(
                child: Text(
                  node.id,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
