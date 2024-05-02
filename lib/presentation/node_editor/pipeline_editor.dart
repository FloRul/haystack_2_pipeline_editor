import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node_widget.dart';
import 'package:haystack_2_pipeline_editor/presentation/providers/pipeline_editor_provider.dart';

class PipelineEditor extends ConsumerWidget {
  const PipelineEditor({super.key, required Offset gridOffset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.watch(pipelineEditorStateNotifierProvider.notifier);
    var nodes = ref.watch(pipelineEditorStateNotifierProvider.select((state) => state.nodesUI));
    return Stack(
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
              key: ValueKey(nodeUI.id),
              node: nodeUI,
            ),
          ),
        );
      }).toList(),
    );
  }
}
