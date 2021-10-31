import 'package:flutter/material.dart';
import 'package:project/featured/demo/pages/demo_list.page.dart';
import 'package:project/featured/demo/pages/rx/rx_behaviour_subject.page.dart';
import 'package:project/featured/demo/pages/rx/rx_list.page.dart';
import 'package:project/featured/demo/pages/rx/rx_combine_latest_stream.page.dart';
import 'package:project/featured/demo/pages/rx/rx_skip_while.page.dart';
import 'package:project/featured/home/home.page.dart';
import 'package:project/featured/user/pages/user_detail.page.dart';
import 'package:project/featured/user/pages/user_list.page.dart';
import 'package:project/shared/models/user.model.dart';
import 'package:project/shared/pages/error.page.dart';

import 'featured/demo/pages/rx/rx_scan.page.dart';

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

      case '/demo':
        return MaterialPageRoute(builder: (_) => DemoListPage());

      case '/demo/rx':
        return MaterialPageRoute(builder: (_) => RXListPage());

      case '/demo/rx/behaviour_subject':
        return MaterialPageRoute(builder: (_) => RXBehaviourSubjectPage());

      case '/demo/rx/conbine_latest_stream':
        return MaterialPageRoute(builder: (_) => RXCombineLatestStreamPage());

      case '/demo/rx/skip_while_operator':
        return MaterialPageRoute(builder: (_) => RXSkipWhileOperatorPage());

      case '/demo/rx/scan_operator':
        return MaterialPageRoute(builder: (_) => RXScanOperatorPage());

      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
