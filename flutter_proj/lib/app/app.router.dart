import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
import 'package:flutter_proj/featured/home/home.page.dart';
import 'package:flutter_proj/featured/restful/restful_detail/restful_detail.page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 80, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false, // Should each log print contain a timestamp
      ),
    );

    final args = settings.arguments;

    logger.i('Will navigate to -> ${settings.name}');

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
