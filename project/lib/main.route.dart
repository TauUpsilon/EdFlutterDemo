import 'package:flutter/material.dart';
import 'package:project/featured/demo/pages/clone/clone_list.page.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/ubike_list.page.dart';
import 'package:project/featured/demo/pages/demo_list.page.dart';
import 'package:project/featured/demo/pages/rx/list_items/rx_behaviour_subject.page.dart';
import 'package:project/featured/demo/pages/rx/list_items/rx_combine_latest_stream.page.dart';
import 'package:project/featured/demo/pages/rx/list_items/rx_scan.page.dart';
import 'package:project/featured/demo/pages/rx/list_items/rx_skip_while.page.dart';
import 'package:project/featured/demo/pages/rx/rx_list.page.dart';
import 'package:project/featured/home/home.page.dart';
import 'package:project/shared/pages/error.page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print('Route is at - ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      // case '/user/user_detail':
      //   if (args is User) {
      //     return MaterialPageRoute(
      //       builder: (_) => UserDetailPage(
      //         user: args,
      //       ),
      //     );
      //   }

      //   return MaterialPageRoute(builder: (_) => ErrorPage());

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

      case '/demo/clone':
        return MaterialPageRoute(builder: (_) => CloneListPage());

      case '/demo/clone/ubike':
        return MaterialPageRoute(builder: (_) => UBikeListPage());

      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
