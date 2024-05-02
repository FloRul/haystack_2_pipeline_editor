import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/nodes.dart';
import 'package:haystack_2_pipeline_editor/presentation/providers/pipeline_editor_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pipeline_editor_provider.g.dart';

@Riverpod(keepAlive: true)
class PipelineEditorStateNotifier extends _$PipelineEditorStateNotifier {
  @override
  PipelineEditorState build() {
    return PipelineEditorState.initial();
  }

  void addNode(BaseNode node, double dx, double dy) {
    state = state.copyWith(
      nodesUI: [
        ...state.nodesUI,
        NodeUI(
          nodeId: node.id,
          dx: dx,
          dy: dy,
          input: SocketUI(
            nodeId: node.id,
            id: '${node.id}_input',
            dx: 0,
            dy: 50,
          ),
          output: SocketUI(
            nodeId: node.id,
            id: '${node.id}_output',
            dx: 120,
            dy: 50,
          ),
        ),
      ],
    );
  }

  void updateNodePosition(String nodeId, Offset offset) {
    state = state.copyWith(
      nodesUI: state.nodesUI.map((nodeUI) {
        if (nodeUI.nodeId == nodeId) {
          return nodeUI.copyWith(
            dx: offset.dx + nodeUI.dx,
            dy: offset.dy + nodeUI.dy,
          );
        }
        return nodeUI;
      }).toList(),
    );
  }

  void onPanGrid(Offset delta) {
    var nextOffset = state.dragOffset + delta;
    if ((nextOffset.dx <= state.maxDragOffset && nextOffset.dy <= state.maxDragOffset) &&
        (nextOffset.dx >= -state.maxDragOffset && nextOffset.dy >= -state.maxDragOffset)) {
      state = state.copyWith(
        dragOffset: nextOffset,
      );
      for (int i = 0; i < state.nodesUI.length; i++) {
        updateNodePosition(state.nodesUI[i].nodeId, delta);
      }
    }
  }

  void registerConnection({required String fromNodeId, required String toNodeId}) {
    // Find the input and output sockets
    final inputSocket = state.nodesUI.firstWhere((nodeUI) => nodeUI.nodeId == toNodeId,).input;

    final outputSocket = state.nodesUI.firstWhere((nodeUI) => nodeUI.nodeId == fromNodeId,).output;

    state = state.copyWith(
      connections: [
        ...state.connections,
        ConnectionUI(
          input: inputSocket,
          output: outputSocket,
        ),
      ],
    );
  }
}
