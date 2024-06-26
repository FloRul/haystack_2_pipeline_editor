﻿import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/knob.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/nodes.dart';

class NodeWidget extends StatelessWidget {
  const NodeWidget({
    super.key,
    required this.node,
    required this.inputSocket,
    required this.outputSocket,
  });

  final NodeUI node;
  final SocketUI? inputSocket;
  final SocketUI? outputSocket;

  final knobSize = 20.0;

  final double width = 120;
  final double height = 100;

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
            child: Column(
              children: [
                Text(
                  node.id,
                  style: const TextStyle(color: Colors.white),
                ),
                Text('${node.position.dx.ceil()}, ${node.position.dy.ceil()}')
              ],
            ),
          ),
          if (inputSocket != null)
            Positioned(
              left: knobSize / 4,
              top: height / 2 - knobSize / 2,
              child: Knob(
                key: ValueKey('${node.id}_input'),
                color: Colors.red,
                duration: const Duration(milliseconds: 50),
                knobSize: knobSize,
                socket: inputSocket!,
              ),
            ),
          if (outputSocket != null)
            Positioned(
              right: knobSize / 4,
              top: height / 2 - knobSize / 2,
              child: Knob(
                key: ValueKey('${node.id}_output'),
                color: Colors.green,
                duration: const Duration(milliseconds: 50),
                knobSize: knobSize,
                socket: outputSocket!,
              ),
            ),
        ],
      ),
    );
  }
}
