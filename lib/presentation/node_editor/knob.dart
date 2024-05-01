import 'package:flutter/material.dart';

class Knob extends StatefulWidget {
  final Color color;
  final Duration duration;
  final double knobSize;

  const Knob({
    super.key,
    required this.color,
    required this.duration,
    required this.knobSize,
  });

  @override
  State<Knob> createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  bool _isDragging = false;
  bool _isHovering = false;
  Offset _cursorOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: KnobPainter(
        isDragging: _isDragging,
        cursorPosition: _cursorOffset,
        knobSize: widget.knobSize,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (details) {
          setState(() {
            _isDragging = true;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _isDragging = false;
          });
        },
        onPanCancel: () {
          setState(() {
            _isDragging = false;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _cursorOffset = details.localPosition;
          });
        },
        child: MouseRegion(
          onEnter: (event) => setState(() => _isHovering = true),
          onExit: (event) => setState(() => _isHovering = false),
          child: AnimatedContainer(
            duration: widget.duration,
            width: widget.knobSize,
            height: widget.knobSize,
            transform: Matrix4.identity()..scale(_isHovering || _isDragging ? 1.2 : 1.0),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isDragging ? Colors.amber : widget.color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Knob? _findKnobToConnect() {
    final currentContext = context;
    final currentRenderBox = currentContext.findRenderObject() as RenderBox;
    final currentPosition = currentRenderBox.localToGlobal(_cursorOffset);

    Knob? nearestKnob;
    double minDistance = double.infinity;

    void findNearestKnob(Element element) {
      if (element.widget is Knob && element.widget != widget) {
        final knobRenderBox = element.findRenderObject() as RenderBox;
        final knobPosition = knobRenderBox.localToGlobal(Offset.zero);
        final distance = (knobPosition - currentPosition).distance;

        if (distance < minDistance && distance <= 50.0) {
          nearestKnob = element.widget as Knob;
          minDistance = distance;
        }
      }
      element.visitChildren(findNearestKnob);
    }

    currentContext.visitChildElements(findNearestKnob);

    return nearestKnob;
  }
}

class KnobPainter extends CustomPainter {
  final bool isDragging;
  final Offset cursorPosition;
  final double knobSize;

  KnobPainter({
    required this.isDragging,
    required this.cursorPosition,
    required this.knobSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (isDragging) {
      final paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0;

      final knobCenter = Offset(size.width / 2, size.height / 2);
      canvas.drawLine(knobCenter, cursorPosition, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
