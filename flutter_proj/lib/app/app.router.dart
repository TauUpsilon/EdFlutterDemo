import 'package:flutter/material.dart';
import 'package:flutter_proj/shared/services/app_logger.service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
import 'package:flutter_proj/featured/home/home.page.dart';
import 'package:flutter_proj/featured/restful/restful_detail/restful_detail.page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    AppLogService appLogService = GetIt.instance.get<AppLogService>();

    final args = settings.arguments;
    appLogService.i('Will navigate to -> ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(key: UniqueKey()),
        );

      case '/restful/detail':
        if (args is MBM081018FxRate) {
          return MaterialPageRoute(
            builder: (_) => RestfulDetailPage(
              key: UniqueKey(),
              fxRate: args,
            ),
          );
        }

        return MaterialPageRoute(builder: (_) => const Text('404'));

      default:
        return MaterialPageRoute(builder: (_) => const Text('404'));
    }
  }
}
