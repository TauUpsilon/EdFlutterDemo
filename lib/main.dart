import 'package:eyr/app/app_locator.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppConfig.loadEnv();

  AppInitor.initLocator();

  runApp(
    App(
      key: UniqueKey(),
    ),
  );
}
