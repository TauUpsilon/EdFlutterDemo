import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha.mixin.dart';
import 'package:rxdart/rxdart.dart';

class LifecycleService with Alpha, WidgetsBindingObserver {
  final BehaviorSubject<AppLifecycleState> stateStream = BehaviorSubject();

  LifecycleService() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    stateStream.add(state);
  }

  void onDispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
