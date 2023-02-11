import 'package:flutter/material.dart';
import 'package:flutter_proj/app/app.router.dart';

class MyApp extends StatelessWidget {
  const MyApp({required Key key}) : super(key: key);

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
