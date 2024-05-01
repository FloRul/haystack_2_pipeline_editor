import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/nodes.dart';
part 'pipeline_editor_state.freezed.dart';

@freezed
class PipelineEditorState with _$PipelineEditorState {
  const factory PipelineEditorState({
    required List<BaseNode> nodes,
    required List<Connection> connections,
    required List<NodeUI> nodesUI,
    required List<SocketUI> socketsUI,
    required Offset dragOffset,
    required double maxGridSize,
  }) = _PipelineState;

  factory PipelineEditorState.initial() => const PipelineEditorState(
        nodes: [],
        connections: [],
        nodesUI: [],
        socketsUI: [],
        dragOffset: Offset.zero,
        maxGridSize: 1000,
      );
}
