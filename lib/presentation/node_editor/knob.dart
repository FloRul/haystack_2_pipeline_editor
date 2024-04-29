import 'package:flutter/material.dart';

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
  bool _isHovering = false;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        setState(() => _isDragging = true);
        widget.onConnectionStart(widget.key.toString());
      },
      onTapUp: (details) {
        setState(() => _isDragging = false);
        widget.onConnectionEnd(widget.key.toString(), '');
      },
      onTapCancel: () {
        setState(() => _isDragging = false);
        widget.onConnectionEnd(widget.key.toString(), '');
      },
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget.knobSize,
        height: widget.knobSize,
        transform: Matrix4.identity()..scale(_isHovering ? 1.5 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
