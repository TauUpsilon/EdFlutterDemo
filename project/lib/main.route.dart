import 'package:flutter/material.dart';
import 'package:project/pages/home/home.page.dart';
import 'package:project/pages/user/user_list.page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/user':
        // if(args is String) {
        //   return MaterialPageRoute(builder: (_) => CustonPage(data: args));
        // }
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondatAnimation) =>
                UserListPage(),
            transitionsBuilder: (context, animation, secondatAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(animation),
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset.zero, end: const Offset(-1.0, 0.0))
                        .animate((secondatAnimation)),
                    child: child),
              );
            });

      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
