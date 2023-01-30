import 'package:logger/logger.dart';

class LoggingService extends Logger {
  LoggingService()
      : super(
          level: Level.verbose,
          filter: null,
          printer: PrefixPrinter(
            PrettyPrinter(
              methodCount: 0, // number of method calls to be displayed
              errorMethodCount: 8, //count calls if stacktrace is provided
              lineLength: 80, // width of the output
              colors: false, // Colorful log messages
              printEmojis: false, // Print an emoji for each log message
              printTime: false, // Should each log print contain a timestamp
            ),
          ),
          output: null,
        );
}

class PrefixPrinter extends LogPrinter {
  final LogPrinter _realPrinter;

  PrefixPrinter(
    this._realPrinter, {
    debug,
    verbose,
    wtf,
    info,
    warning,
    error,
    nothing,
  });

  @override
  List<String> log(LogEvent event) {
    return _realPrinter
        .log(event)
        .map((s) => '${PrettyPrinter.levelEmojis[event.level]}$s')
        .toList();
  }
}
