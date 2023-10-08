import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha.core.dart';
import 'package:rxdart/rxdart.dart';

class LifecycleService extends AlphaCore with WidgetsBindingObserver {
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
