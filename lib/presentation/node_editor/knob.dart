import 'package:flutter/material.dart';

class Knob extends StatefulWidget {
  const Knob({
    super.key,
    required this.color,
    required this.duration,
    required this.knobSize,
    required this.data,
  });

  final Color color;
  final Duration duration;
  final double knobSize;
  final String data;
  @override
  State<Knob> createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  bool _isHovering = false;
  bool _isDragging = false;
  Offset _cursorPosition = Offset.zero;
  final GlobalKey _customPaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          return CustomPaint(
            key: _customPaintKey,
            painter: ConnectionPainter(
              color: widget.color,
              originPosition: Offset(widget.knobSize / 2, widget.knobSize / 2),
              cursorPosition: _cursorPosition,
              canPaint: _isDragging,
            ),
            child: Draggable<String>(
              data: widget.data,
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
          return data.data.startsWith('knob_'); // Add this line
        },
        onAcceptWithDetails: (DragTargetDetails<String> details) {
          print('Connecting: ${details.data} with ${widget.data}');
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
