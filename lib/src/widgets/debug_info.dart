import 'dart:async';

import 'package:fl_nodes/src/core/models/events.dart';
import 'package:fl_nodes/src/data.dart';
import 'package:flutter/material.dart';

import 'package:fl_nodes/src/core/controllers/node_editor/core.dart';

class DebugInfoWidget extends StatefulWidget {
  final FlNodeEditorController controller;

  const DebugInfoWidget({
    super.key,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _DebugInfoWidgetState();
}

class _DebugInfoWidgetState extends State<DebugInfoWidget> {
  double get viewportZoom => widget.controller.viewportZoom;
  Offset get viewportOffset => widget.controller.viewportOffset;
  int get selectionCount => widget.controller.selectedNodeIds.length;
  StreamSubscription<NodeEditorEvent>? listener;

  @override
  void initState() {
    super.initState();

    listener = widget.controller.eventBus.events.listen((event) {
      if (event is ViewportOffsetEvent ||
          event is ViewportZoomEvent ||
          event is NodeSelectionEvent) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    listener?.cancel();
    listener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'X: ${viewportOffset.dx.toStringAsFixed(2)}, Y: ${viewportOffset.dy.toStringAsFixed(2)}',
            style: FlData_c.portTextStyle,
          ),
          Text(
            '缩放: ${viewportZoom.toStringAsFixed(2)}',
            style: FlData_c.portTextStyle,
          ),
          Text(
            '已选中: $selectionCount',
            style: FlData_c.portTextStyle,
          ),
        ],
      ),
    );
  }
}
