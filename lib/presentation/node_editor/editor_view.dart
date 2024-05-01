import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/null_node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/background_grid_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/pipeline_editor.dart';
import 'package:haystack_2_pipeline_editor/presentation/providers/pipeline_editor_provider.dart';

typedef DraggingConnection = (String, Offset);
typedef SocketConnection = (String, String);

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var notifier = ref.watch(pipelineEditorStateNotifierProvider.notifier);
    var maxGridSize = ref.watch(pipelineEditorStateNotifierProvider.select((value) => value.maxGridSize));
    var dragOffset = ref.watch(pipelineEditorStateNotifierProvider.select((value) => value.dragOffset));
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onPanUpdate: (details) => notifier.onPanGrid(details.delta),
          child: CustomPaint(
            painter: BackgroundGridPainter(
              maxGridSize: maxGridSize,
              translationOffset: dragOffset,
            ),
            child: PipelineEditor(
              translationOffset: dragOffset,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifier.addNode(NullNode(name: 'null'), 100, 100),
        child: const Icon(Icons.add),
      ),
    );
  }
}
