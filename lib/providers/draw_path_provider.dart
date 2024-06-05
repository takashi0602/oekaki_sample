import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'draw_path_provider.g.dart';

@riverpod
class DrawPathHistory extends _$DrawPathHistory {
  @override
  List<Path> build() {
    return [];
  }

  void addPath(Path path) {
    state = [...state, path];
  }
}

@riverpod
class DrawPath extends _$DrawPath {
  @override
  Path build() {
    return Path();
  }

  void startPath(Offset point) {
    state.moveTo(point.dx, point.dy);
  }

  void updatePath(Offset point) {
    state.lineTo(point.dx, point.dy);
    ref.notifyListeners();
  }

  void endPath() {
    ref.read(drawPathHistoryProvider.notifier).addPath(state);
    state = Path();
  }
}
