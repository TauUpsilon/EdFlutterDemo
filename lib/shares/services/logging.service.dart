import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggingService extends Logger {
  LoggingService()
      : super(
          level: kReleaseMode ? Level.off : Level.debug,
          filter: null,
          printer: PrefixPrinter(
            PrettyPrinter(
              methodCount: 0, // number of method calls to be displayed
              errorMethodCount: 10, //count calls if stacktrace is provided
              lineLength: 60, // width of the output
              colors: false, // Colorful log messages
              printEmojis: false, // Print an emoji for each log message
              printTime: true, // Should each log print contain a timestamp
            ),
          ),
          output: null,
        );
}

class PrefixPrinter extends LogPrinter {
  final LogPrinter _realPrinter;

  PrefixPrinter(
    this._realPrinter,
  );

  @override
  List<String> log(LogEvent event) {
    return _realPrinter
        .log(
          event,
        )
        // .map(
        //   (msg) => '${PrettyPrinter.defaultLevelEmojis[event.level]}$msg',
        // )
        .toList();
  }
}
