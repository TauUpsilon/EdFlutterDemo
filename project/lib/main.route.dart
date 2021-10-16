import 'package:flutter/material.dart';
import 'package:project/featured/home/home.page.dart';
import 'package:project/featured/user/user_detail.page.dart';
import 'package:project/featured/user/user_list.page.dart';
import 'package:project/shared/models/user.model.dart';
import 'package:project/shared/pages/error.page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print('Route is at - ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/user':
        return MaterialPageRoute(builder: (_) => UserListPage());
      // return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondatAnimation) =>
      //         UserListPage(),
      //     transitionsBuilder: (context, animation, secondatAnimation, child) {
      //       const begin = Offset(0.0, 1.0);
      //       const end = Offset.zero;
      //       const curve = Curves.ease;

      //       var tween =
      //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      //       return SlideTransition(
      //         position: animation.drive(tween),
      //         child: child,
      //       );
      //     });
      case '/user/user_detail':
        if (args is User) {
          return MaterialPageRoute(
              builder: (_) => UserDetailPage(
                    user: args,
                  ));
        }

        return MaterialPageRoute(builder: (_) => ErrorPage());

      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
