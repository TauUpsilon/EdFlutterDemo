import 'package:flutter/material.dart';
import 'package:flutter_proj/app/app.widget.dart';

void main() async {
  await AppUtil.setEnvironment();

  AppLocator.initLocator();

  runApp(
    App(
      key: UniqueKey(),
    ),
  );
}
