import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LifecycleService with CommonFunctionable, WidgetsBindingObserver {
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
