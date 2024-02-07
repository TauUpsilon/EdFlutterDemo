import 'dart:developer';

import 'package:eyr/states/env/env_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class LoggingService extends Logger {
  LoggingService()
      : super(
          level: kReleaseMode ? Level.off : Level.all,
          filter: null,
          printer: AppPrettyPrinter(
            methodCount: 0, // number of method calls to be displayed
            errorMethodCount: 10, //count calls if stacktrace is provided
            printEmojis: false,
            lineLength: 60,
            printTime: true,
            levelColors: {
              Level.trace: const AnsiColor.fg(248),
              Level.debug: const AnsiColor.fg(036),
            },
            levelEmojis: {
              Level.trace: '🍷',
              Level.debug: '🐛',
              Level.info: '💡',
              Level.warning: '🚧',
              Level.error: '👹',
              Level.fatal: '😈',
            },
          ),
          output: AppConsoleOutput(),
        );
}

class AppConsoleOutput extends ConsoleOutput {
  EnvCubit get _envCubit => GetIt.I<EnvCubit>();

  @override
  void output(OutputEvent event) {
    final startLine = event.lines.getRange(0, 1);
    final datetime = event.lines.getRange(1, 2);
    final content = event.lines.getRange(2, event.lines.length);

    final outputList = [
      startLine.map((e) => '$e\n'),
      datetime.map((e) => '$e\n'),
      content.map((e) => '${e.replaceAll(PrettyPrinter.verticalLine, ' ')}\n'),
    ];

    log(
      outputList.expand((e) => e).join(),
      name: _envCubit.state.appName,
    );
  }
}

class AppPrettyPrinter extends PrettyPrinter {
  AppPrettyPrinter({
    super.stackTraceBeginIndex,
    super.methodCount,
    super.errorMethodCount,
    super.lineLength,
    super.colors,
    super.printEmojis,
    super.printTime,
    super.excludeBox,
    super.noBoxingByDefault,
    super.excludePaths,
    super.levelColors,
    super.levelEmojis,
  });

  @override
  List<String> log(LogEvent event) {
    return super
        .log(event)
        .indexed
        .map<String>(
          (e) => e.$1 == 1
              ? e.$2.replaceFirst(
                  ' ',
                  ' ${levelEmojis?[event.level]} ',
                )
              : e.$2,
        )
        .toList();
  }
}
