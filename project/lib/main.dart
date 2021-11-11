import 'package:flutter/material.dart';
import 'package:project/main.locator.dart';
import 'package:project/main.reflectable.dart';
import 'package:project/main.route.dart';
import 'package:project/main.theme.dart';

void main() {
  initializeReflectable();
  initializeLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edward Flutter Portfolio',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: MainTheme.darkTheme,
    );
  }
}
