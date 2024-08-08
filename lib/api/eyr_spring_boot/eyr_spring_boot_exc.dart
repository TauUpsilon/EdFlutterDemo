part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

class EYRSpringBootExc extends ApiException {
  EYRSpringBootExc({
    super.status,
    super.from,
    super.response,
  });

  @override
  String toString() {
    final body = jsonDecode(response?.body ?? '') as Map<String, dynamic>;
    final error = body['error'] as Map<String, dynamic>;
    final stacktrace = (error['stacktrace'] as String)
        .replaceAll(RegExp(r'[\[\]]'), '')
        .split(',');

    return StringUtil.prettyLog(
      'Error -> $runtimeType',
      {
        'From': from,
        'Status': response?.statusCode,
        'Code': error['code'],
        'Reason': error['msg'],
        'StackTrace': '[\n   ${stacktrace.sublist(0, 15).join('\n  ')}\n]',
      },
    );
  }
}
