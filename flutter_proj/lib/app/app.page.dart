import 'package:flutter/material.dart';
import 'package:flutter_proj/app/app.router.dart';
// import 'package:flutter_proj/featured/home/home.page.dart';

class MyApp extends StatefulWidget {
  const MyApp({required Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(key: UniqueKey()),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
