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
      nodeId: newNode.id,
      position: position + Offset(0, nodeSize.height / 2),
      type: SocketType.input,
    );
    var outputSocket = SocketUI(
      nodeId: newNode.id,
      position: position + Offset(nodeSize.width, nodeSize.height / 2),
      type: SocketType.output,
    );
    state = state.copyWith(
      nodesUI: [
        ...state.nodesUI,
        newNode,
      ],
      sockets: [
        ...state.sockets,
        inputSocket,
        outputSocket,
      ],
    );
  }

  void updateNodePosition(String nodeId, Offset offset) {
    var newNodes = state.nodesUI.map((nodeUI) {
      if (nodeUI.id == nodeId) {
        return nodeUI.copyWith(
          position: nodeUI.position + offset,
        );
      }
      return nodeUI;
    }).toList();

    var newSockets = state.sockets.map((socket) {
      if (socket.nodeId == nodeId) {
        return socket.copyWith(
          position: socket.position + offset,
        );
      }
      return socket;
    }).toList();

    var newConnections = state.connections.map((c) {
      if (c.from.nodeId == nodeId) {
        return c.copyWith(
          from: c.from.copyWith(
            position: c.from.position + offset,
          ),
        );
      } else if (c.to.nodeId == nodeId) {
        return c.copyWith(
          to: c.to.copyWith(
            position: c.to.position + offset,
          ),
        );
      }
      return c;
    }).toList();

    state = state.copyWith(
      nodesUI: newNodes,
      sockets: newSockets,
      connections: newConnections,
    );
  }

  void onPanGrid(Offset delta) {
    var nextOffset = state.gridOffset + delta;
    if ((nextOffset.dx <= state.maxDragOffset && nextOffset.dy <= state.maxDragOffset) &&
        (nextOffset.dx >= -state.maxDragOffset && nextOffset.dy >= -state.maxDragOffset)) {
      var newNodes = state.nodesUI.map((nodeUI) {
        return nodeUI.copyWith(
          position: nodeUI.position + delta,
        );
      }).toList();

      var newSockets = state.sockets.map((socket) {
        return socket.copyWith(
          position: socket.position + delta,
        );
      }).toList();

      var newConnections = state.connections.map((c) {
        return c.copyWith(
          from: c.from.copyWith(
            position: c.from.position + delta,
          ),
          to: c.to.copyWith(
            position: c.to.position + delta,
          ),
        );
      }).toList();

      state = state.copyWith(
        gridOffset: nextOffset,
        nodesUI: newNodes,
        sockets: newSockets,
        connections: newConnections,
      );
    }
  }

  void registerConnection({required SocketUI from, required SocketUI to}) {
    state = state.copyWith(
      connections: [
        ...state.connections,
        ConnectionUI(
          from: from.copyWith(position: from.position),
          to: to.copyWith(position: to.position),
        ),
      ],
    );
  }

  void clear() => state = PipelineEditorState.initial();
}
