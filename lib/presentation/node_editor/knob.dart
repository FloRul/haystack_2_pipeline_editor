import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haystack_2_pipeline_editor/models/nodes/base_node.dart';
import 'package:haystack_2_pipeline_editor/presentation/providers/pipeline_editor_provider.dart';

class Knob extends ConsumerStatefulWidget {
  const Knob({
    super.key,
    required this.color,
    required this.duration,
    required this.knobSize,
    required this.nodeId,
    required this.socketType,
  });

  final Color color;
  final Duration duration;
  final double knobSize;
  final String nodeId;
  final SocketType socketType;
  @override
  ConsumerState<Knob> createState() => _KnobState();
}

class _KnobState extends ConsumerState<Knob> {
  bool _isHovering = false;
  bool _isDragging = false;
  Offset _cursorPosition = Offset.zero;
  final GlobalKey _customPaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var notifier = ref.watch(pipelineEditorStateNotifierProvider.notifier);
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: DragTarget<(String, SocketType)>(
        builder: (context, candidateData, rejectedData) {
          return CustomPaint(
            key: _customPaintKey,
            painter: ConnectionPainter(
              color: widget.color,
              originPosition: Offset(widget.knobSize / 2, widget.knobSize / 2),
              cursorPosition: _cursorPosition,
              canPaint: _isDragging,
            ),
            child: Draggable<(String, SocketType)>(
              data: (widget.nodeId, widget.socketType),
              onDragStarted: () => setState(() => _isDragging = true),
              onDragEnd: (details) => setState(() => _isDragging = false),
              onDraggableCanceled: (_, __) => setState(() => _isDragging = false),
              onDragUpdate: (details) {
                final RenderBox renderBox = _customPaintKey.currentContext!.findRenderObject() as RenderBox;
                final localPosition = renderBox.globalToLocal(details.globalPosition);
                setState(() {
                  _cursorPosition = localPosition;
                });
              },
              feedback: Container(
                width: widget.knobSize,
                height: widget.knobSize,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              child: AnimatedContainer(
                duration: widget.duration,
                width: widget.knobSize,
                height: widget.knobSize,
                transform: Matrix4.identity()..scale(_isHovering ? 1.2 : 1.0),
                transformAlignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color,
                ),
              ),
            ),
          );
        },
        onWillAcceptWithDetails: (data) {
          return data.data.$1 != widget.nodeId && data.data.$2 != widget.socketType; // Add this line
        },
        onAcceptWithDetails: (DragTargetDetails<(String, SocketType)> details) {
          print('Connecting: ${details.data} with ${widget.nodeId}');
          notifier.registerConnection(fromNodeId: widget.nodeId, toNodeId: details.data.$1);
        },
      ),
    );
  }
}

class ConnectionPainter extends CustomPainter {
  ConnectionPainter({
    required this.color,
    required this.originPosition,
    required this.cursorPosition,
    required this.canPaint,
  });

  final Color color;
  final Offset originPosition;
  final Offset cursorPosition;
  final bool canPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (!canPaint) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(originPosition, cursorPosition, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
