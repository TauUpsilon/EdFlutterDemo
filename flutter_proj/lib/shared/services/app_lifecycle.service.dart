import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppLifecycleService with WidgetsBindingObserver {
  final BehaviorSubject<AppLifecycleState> stateStream = BehaviorSubject();

  AppLifecycleService() {
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
