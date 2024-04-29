import 'package:flutter/material.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/background_grid_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/connection_painter.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/draggable_node.dart';
import 'package:haystack_2_pipeline_editor/presentation/node_editor/node.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  List<ValueNotifier<Node>> _nodes = [];
  List<ValueNotifier<Connection>> _connections = [];
  ValueNotifier<Offset> _translationOffset = ValueNotifier(Offset.zero);
  String? _connectingNodeId;
  late bool _canPan;

  @override
  void initState() {
    _nodes = [];
    _connections = [];
    _translationOffset = ValueNotifier(Offset.zero);
    _canPan = true;
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
          onPanDown: (details) {
            setState(() {
              _canPan = true;
            });
          },
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
            if ((_connectingNodeId == null && _canPan)) {
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
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        // Render nodes
                        for (var vnode in _nodes)
                          ValueListenableBuilder<Node>(
                            valueListenable: vnode,
                            builder: (context, node, child) {
                              return Positioned(
                                left: node.position.dx + offset.dx,
                                top: node.position.dy + offset.dy,
                                child: DraggableNode(
                                  onConnectionStart: _handleConnectionStart,
                                  onConnectionEnd: _handleConnectionEnd,
                                  vnode: vnode,
                                  onDragStart: () {
                                    setState(() {
                                      _canPan = false;
                                    });
                                  },
                                  onDragEnd: (details) {
                                    final renderBox = context.findRenderObject() as RenderBox;
                                    final nodeOffset = renderBox.globalToLocal(details.offset);
                                    final initialPosition = vnode.value.position;
                                    final translationOffset = _EditorScreenState()._translationOffset.value;
                                    final newPosition = initialPosition + nodeOffset - translationOffset;

                                    // Constrain the node position within the canvas bounds
                                    final constrainedPosition = Offset(
                                      newPosition.dx.clamp(0.0, constraints.maxWidth - renderBox.size.width),
                                      newPosition.dy.clamp(0.0, constraints.maxHeight - renderBox.size.height),
                                    );

                                    vnode.value = vnode.value.copyWith(position: constrainedPosition);
                                  },
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  },
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
              ValueNotifier<Node>(
                Node(
                  id: 'node_${_nodes.length}',
                  position: const Offset(100, 100),
                ),
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
