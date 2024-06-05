import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oekaki_sample/components/path_painter.dart';
import 'package:oekaki_sample/providers/draw_path_provider.dart';

class CanvasArea extends ConsumerWidget {
  const CanvasArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawPath = ref.watch(drawPathProvider);
    final drawPathHistory = ref.watch(drawPathHistoryProvider);

    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        ref.read(drawPathProvider.notifier).startPath(details.localPosition);
      },
      onPanUpdate: (DragUpdateDetails details) {
        ref.read(drawPathProvider.notifier).updatePath(details.localPosition);
      },
      onPanEnd: (DragEndDetails details) {
        ref.read(drawPathProvider.notifier).endPath();
      },
      child: Stack(
        children: [
          for (final path in drawPathHistory)
            CustomPaint(
              size: Size.infinite,
              painter: PathPainter(path),
            ),
          CustomPaint(
            size: Size.infinite,
            painter: PathPainter(drawPath),
          ),
        ],
      ),
    );
  }
}
