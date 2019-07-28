import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class Counter {
  int pressed;

  Counter() {
    pressed = 0;
  }
}

class Bloc {
  final Counter counter = Counter();

  final BehaviorSubject<int> _itemCount = BehaviorSubject<int>(seedValue: 0);

  final StreamController<int> _controller = StreamController<int>();

  Bloc() {
      debugPrint(counter.pressed.toString());
    _controller.stream.listen((data) {
      counter.pressed += 1;
      _itemCount.add(counter.pressed);
    });
  }

  Sink<int> get addOne => _controller.sink;

  Stream<int> get itemCount => _itemCount.stream;

  void dispose() {
    _itemCount.close();
    _controller.close();
  }
}
