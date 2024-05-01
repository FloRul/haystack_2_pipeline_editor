import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node_widget.dart';
import 'package:haystack_2_pipeline_editor/presentation/providers/pipeline_editor_provider.dart';

class PipelineEditor extends ConsumerWidget {
  const PipelineEditor({super.key, required Offset translationOffset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.watch(pipelineEditorStateNotifierProvider.notifier);
    var state = ref.watch(pipelineEditorStateNotifierProvider);
    return Stack(
      children: state.nodesUI.map((nodeUI) {
        return Positioned(
          left: nodeUI.dx,
          top: nodeUI.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              notifier.updateNodePosition(
                nodeUI.nodeId,
                Offset(
                  nodeUI.dx + details.delta.dx,
                  nodeUI.dy + details.delta.dy,
                ),
              );
            },
            child: NodeWidget(
              key: ValueKey(nodeUI.nodeId),
              node: nodeUI,
            ),
          ),
        );
      }).toList(),
    );
  }
}
