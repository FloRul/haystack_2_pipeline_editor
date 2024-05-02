﻿import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node_widget.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/painters/background_grid_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/painters/connection_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/painters/merged_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/providers/pipeline_editor_provider.dart';

typedef DraggingConnection = (String, Offset);
typedef SocketConnection = (String, String);

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var notifier = ref.watch(pipelineEditorStateNotifierProvider.notifier);
    var maxGridSize = ref.watch(pipelineEditorStateNotifierProvider.select((value) => value.maxGridSize));
    var gridOffset = ref.watch(pipelineEditorStateNotifierProvider.select((value) => value.gridOffset));
    var connections = ref.watch(pipelineEditorStateNotifierProvider.select((value) => value.connections));
    var nodes = ref.watch(pipelineEditorStateNotifierProvider.select((state) => state.nodesUI));
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onPanUpdate: (details) => notifier.onPanGrid(details.delta),
          child: CustomPaint(
            painter: CombinedPainter(
              firstPainter: BackgroundGridPainter(
                maxGridSize: maxGridSize,
                gridOffset: gridOffset,
              ),
              secondPainter: ConnectionPainter(
                connections: connections,
              ),
            ),
            child: Stack(
              children: nodes.map((nodeUI) {
                return Positioned(
                  left: nodeUI.position.dx,
                  top: nodeUI.position.dy,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      notifier.updateNodePosition(
                        nodeUI.id,
                        Offset(
                          details.delta.dx,
                          details.delta.dy,
                        ),
                      );
                    },
                    child: NodeWidget(
                      node: nodeUI,
                      inputSocket: ref.watch(
                        pipelineEditorStateNotifierProvider.select(
                          (state) {
                            return state.sockets.firstWhere(
                              (socket) => socket.nodeId == nodeUI.id && socket.type == SocketType.input,
                            );
                          },
                        ),
                      ),
                      outputSocket: ref.watch(
                        pipelineEditorStateNotifierProvider.select(
                          (state) {
                            return state.sockets.firstWhere(
                              (socket) => socket.nodeId == nodeUI.id && socket.type == SocketType.output,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => notifier.addNode(
                id: 'null_node_${DateTime.now().millisecondsSinceEpoch}',
                position: const Offset(100, 100),
                nodeSize: const Size(120, 100),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: notifier.clear,
              child: const Icon(Icons.clear),
            ),
          ),
        ],
      ),
    );
  }
}
