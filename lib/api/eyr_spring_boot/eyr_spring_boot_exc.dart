part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

class EYRSpringBootExc extends ApiException {
  EYRSpringBootExc({
    super.status,
    super.from,
    super.response,
  });

  @override
  String toLog() {
    final stacktrace =
        List.generate(stack.length, (i) => '#$i\t${stack[i].trim()}')
            .sublist(0, 10)
            .join('\n');

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
  String toString() {
    return 'EYRSpringBootException: ${error['code']}';
  }
}
