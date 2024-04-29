import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Knob extends StatefulWidget {
  final Color color;
  final Duration duration;
  final double knobSize;
  final Function(String) onConnectionStart;
  final Function(String, String) onConnectionEnd;

  const Knob({
    super.key,
    required this.color,
    required this.duration,
    required this.knobSize,
    required this.onConnectionStart,
    required this.onConnectionEnd,
  });

  @override
  State<Knob> createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (details) {
        setState(() {
          _isDragging = true;
        });
        widget.onConnectionStart(widget.key.toString());
      },
      onPanEnd: (details) {
        setState(() {
          _isDragging = false;
        });
        widget.onConnectionEnd(widget.key.toString(), '');
      },
      onPanCancel: () {
        setState(() {
          _isDragging = false;
        });
        widget.onConnectionEnd(widget.key.toString(), '');
      },
      onPanUpdate: (details) {
        // Absorb the pan gesture to prevent dragging the node widget
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.globalToLocal(details.globalPosition);
        final hitTestSize = renderBox.size.width * 2;
        final hitTestOffset = renderBox.size.width / 2;
        final hitTestRect = Rect.fromLTWH(
          position.dx - hitTestOffset,
          position.dy - hitTestOffset,
          hitTestSize,
          hitTestSize,
        );
        final hitTestResult = renderBox.hitTest(BoxHitTestResult(), position: hitTestRect.center);
        if (hitTestResult) {
          widget.onConnectionEnd(widget.key.toString(), '');
        }
      },
      child: AbsorbPointer(
        child: AnimatedContainer(
          duration: widget.duration,
          width: widget.knobSize,
          height: widget.knobSize,
          transform: Matrix4.identity()..scale(_isDragging ? 1.2 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isDragging ? Colors.amber : widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
