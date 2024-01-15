import 'package:eyr/shares/observers/app_router.observer.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LifecycleService with WidgetsBindingObserver, AppRoutingObserver {
  final BehaviorSubject<AppLifecycleState> stateStream = BehaviorSubject();

  LifecycleService() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addRouteObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    stateStream.add(state);
  }

  void onDispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
