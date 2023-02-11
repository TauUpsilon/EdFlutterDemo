import 'package:flutter/material.dart';
import 'package:flutter_proj/core/app.service.dart';
import 'package:rxdart/rxdart.dart';

class AppLifecycleService extends AppService with WidgetsBindingObserver {
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
