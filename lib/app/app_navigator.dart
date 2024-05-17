import 'package:flutter/material.dart';

mixin AppNavigator {
  static final key = GlobalKey<NavigatorState>();
  static final context = key.currentContext ?? (throw Exception('no context'));
}
