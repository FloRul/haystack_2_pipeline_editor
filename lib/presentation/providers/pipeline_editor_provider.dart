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

  void addNode({
    required String id,
    required Offset position,
    required Size nodeSize,
  }) {
    var newNode = NodeUI(nodeId: id, position: position);
    var inputSocket = SocketUI(
      node: newNode,
      nodeOffset: Offset(0, nodeSize.height / 2),
      type: SocketType.input,
    );
    var outputSocket = SocketUI(
      node: newNode,
      nodeOffset: Offset(nodeSize.width, nodeSize.height / 2),
      type: SocketType.output,
    );
    state = state.copyWith(
      nodesUI: [
        ...state.nodesUI,
        newNode.copyWith(input: inputSocket, output: outputSocket),
      ],
    );
  }

  void updateNodePosition(String nodeId, Offset offset) {
    state = state.copyWith(
      nodesUI: state.nodesUI.map((nodeUI) {
        if (nodeUI.id == nodeId) {
          return nodeUI.copyWith(
            position: nodeUI.position + offset,
            input: nodeUI.input!.copyWith(node: nodeUI),
            output: nodeUI.output!.copyWith(node: nodeUI),
          );
        }
        return nodeUI;
      }).toList(),
      connections: state.connections.map((connection) {
        if (connection.from.node.id == nodeId) {
          return connection.copyWith(
            from: connection.from.copyWith(
              nodeOffset: connection.from.nodeOffset + offset,
            ),
          );
        } else if (connection.to.node.id == nodeId) {
          return connection.copyWith(
            to: connection.to.copyWith(
              nodeOffset: connection.to.nodeOffset + offset,
            ),
          );
        }
        return connection;
      }).toList(),
    );
  }

  void onPanGrid(Offset delta) {
    var nextOffset = state.gridOffset + delta;
    if ((nextOffset.dx <= state.maxDragOffset && nextOffset.dy <= state.maxDragOffset) &&
        (nextOffset.dx >= -state.maxDragOffset && nextOffset.dy >= -state.maxDragOffset)) {
      state = state.copyWith(
        gridOffset: nextOffset,
      );
      for (int i = 0; i < state.nodesUI.length; i++) {
        updateNodePosition(state.nodesUI[i].id, delta);
      }
    }
  }

  void registerConnection({required SocketUI from, required SocketUI to}) {
    state = state.copyWith(
      connections: [
        ...state.connections,
        ConnectionUI(
          from: from,
          to: to,
        ),
      ],
    );
  }

  void clear() => state = PipelineEditorState.initial();
}
