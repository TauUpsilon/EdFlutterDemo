import 'package:eyr/api/api_service.dart';
import 'package:eyr/shared/utils/string_util.dart';

class EYRSpringBootExc extends ApiException {
  String? stackTrace;

  EYRSpringBootExc(super.status, [super.from, super.reason, this.stackTrace]);

  @override
  String toString() => StringUtil.prettyLog(
        'Error -> EYRSpringBoot',
        {
          'Status': status,
          'From': from,
          'Reason': reason,
        },
      );
}
