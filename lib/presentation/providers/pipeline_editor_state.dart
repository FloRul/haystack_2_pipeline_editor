import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/nodes.dart';
part 'pipeline_editor_state.freezed.dart';

@freezed
class PipelineEditorState with _$PipelineEditorState {
  const factory PipelineEditorState({
    required List<ConnectionUI> connections,
    required List<NodeUI> nodesUI,
    required Offset dragOffset,
    required double maxGridSize,
    required double maxDragOffset,
  }) = _PipelineState;

  factory PipelineEditorState.initial() => const PipelineEditorState(
        connections: [],
        nodesUI: [],
        dragOffset: Offset.zero,
        maxGridSize: 1000,
        maxDragOffset: 100,
      );
}
