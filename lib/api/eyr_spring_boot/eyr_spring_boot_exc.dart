part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

class EYRSpringBootExc extends ApiException {
  EYRSpringBootExc({
    super.status,
    super.from,
    super.response,
  });

  final _env = GetIt.I<EnvCubit>();

  @override
  String toLog() {
    final stacktrace = stack.length >= 10
        ? List.generate(stack.length, (i) => '#$i\t${stack[i].trim()}')
            .sublist(0, 10)
            .join('\n')
        : [];

    return StringUtil.prettyLog(
      'Error -> $runtimeType',
      {
        'From': from,
        'Status': response?.statusCode,
        'Code': error['code'],
        'Reason': error['msg'],
        'StackTrace': '\n$stacktrace',
      },
    );
  }

  @override
  StackTrace? toCrashlytics() {
    final errList = List.generate(
      stack.length,
      (i) {
        // com.eyr.demo.api000.API000ServiceImpl.api000004(API000ServiceImpl.kt:79)
        final errLine = stack[i].trim();
        // [com.eyr.demo.api000.API000ServiceImpl.api000004, API000ServiceImpl.kt:79)]
        final splitted = errLine.split(RegExp(r'\('));
        // API000ServiceImpl.api000004
        final classPart = splitted[0]
            .split('.')
            .sublist(splitted[0].split('.').length - 2)
            .join('.');
        // http://10.0.2.2:8080/api/v1/API000001 -> API001001
        final api = from?.split('/api/v1/').last.split('?').first ?? '';
        // (API000001 👉🏻 API000ServiceImpl.kt:79)
        final filePart = '($api 👉🏻 ${splitted[splitted.length - 1]}';
        // #0   API000ServiceImpl.api000004 (API000001 👉🏻 API000ServiceImpl.kt:79)
        return '#$i\t$classPart $filePart';
      },
    );

    if (from == null || errList.isEmpty) return null;

    return StackTrace.fromString(
      errList.length >= 5
          ? errList.sublist(0, 5).join('\n')
          : errList.join('\n'),
    );
  }

  @override
  String toString() {
    final appEnv = _env.state.appEnv.toUpperCase();

    return '$appEnv EYRSpringBootException: ${error['code']}';
  }
}
