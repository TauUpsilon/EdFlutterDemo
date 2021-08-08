import 'package:flutter/material.dart';
import 'package:project/main.locator.dart';
import 'package:project/main.reflectable.dart';
import 'package:project/main.route.dart';

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
      theme: ThemeData(
          primaryColor: Colors.grey[900],
          buttonColor: Colors.blueGrey,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.grey[200])),
    );
  }
}
