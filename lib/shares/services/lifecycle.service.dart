import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:rxdart/rxdart.dart';

class LifecycleService with AlphaBase, WidgetsBindingObserver {
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
