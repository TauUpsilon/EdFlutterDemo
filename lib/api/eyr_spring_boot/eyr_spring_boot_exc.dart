part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

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
