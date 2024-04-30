import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/background_grid_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/connection_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node_widget.dart';

enum DraggingType {
  none,
  node,
  connection,
}

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  List<ValueNotifier<(Node, Offset)>> _nodes = [];
  List<ValueNotifier<Connection>> _connections = [];
  ValueNotifier<Offset> _translationOffset = ValueNotifier(Offset.zero);
  String? _connectingNodeId;
  final ValueNotifier<DraggingType> _draggingType = ValueNotifier(DraggingType.none);

  @override
  void initState() {
    _nodes = [];
    _connections = [];
    _translationOffset = ValueNotifier(Offset.zero);
    super.initState();
  }

  void _handleConnectionStart(String nodeId) {
    _connectingNodeId = nodeId;
  }

  void _handleConnectionEnd(String sourceNodeId, String destinationNodeId) {
    if (_connectingNodeId != null && destinationNodeId.isNotEmpty) {
      setState(() {
        _connections.add(
          ValueNotifier<Connection>(
            Connection(
              sourceNodeId: _connectingNodeId!,
              destinationNodeId: destinationNodeId,
            ),
          ),
        );
      });
    }
    _connectingNodeId = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Node Editor'),
      ),
      body: Container(
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onPanUpdate: (details) {
            // Define the constraint limits
            const double minOffsetX = -100.0;
            const double maxOffsetX = 100.0;
            const double minOffsetY = -50.0;
            const double maxOffsetY = 50.0;

            // Calculate the new offset by adding the delta
            double newOffsetX = _translationOffset.value.dx + details.delta.dx;
            double newOffsetY = _translationOffset.value.dy + details.delta.dy;

            // Constrain the new offset within the specified limits
            newOffsetX = newOffsetX.clamp(minOffsetX, maxOffsetX);
            newOffsetY = newOffsetY.clamp(minOffsetY, maxOffsetY);

            // Update the _translationOffset with the constrained values
            if ((_connectingNodeId == null && _draggingType.value == DraggingType.none)) {
              _translationOffset.value = Offset(newOffsetX, newOffsetY);
            }
          },
          child: ValueListenableBuilder<Offset>(
            valueListenable: _translationOffset,
            builder: (context, offset, child) {
              return CustomPaint(
                painter: BackgroundGridPainter(translationOffset: offset),
                foregroundPainter: ConnectionPainter(
                  nodes: _nodes.map((e) => e.value).toList(),
                  connections: _connections.map((e) => e.value).toList(),
                  translationOffset: offset,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: _nodes
                        .map(
                          (vnode) => ValueListenableBuilder<(Node, Offset)>(
                            valueListenable: vnode,
                            builder: (context, node, child) => Positioned(
                              left: node.$2.dx + offset.dx,
                              top: node.$2.dy + offset.dy,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  setState(() {
                                    vnode.value = (
                                      vnode.value.$1,
                                      vnode.value.$2.translate(details.delta.dx, details.delta.dy),
                                    );
                                  });
                                },
                                child: NodeWidget(
                                  draggingType: _draggingType,
                                  node: node.$1,
                                  onConnectionStart: _handleConnectionStart,
                                  onConnectionEnd: _handleConnectionEnd,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new node
          setState(() {
            _nodes.add(
              ValueNotifier<(Node, Offset)>((
                Node(
                  id: 'node_${_nodes.length}',
                ),
                const Offset(100, 100)
              )),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
