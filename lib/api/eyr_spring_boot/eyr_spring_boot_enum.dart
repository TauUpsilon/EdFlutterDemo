part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

enum EYRSpringBoot {
  ezwt0000,
}

extension EYRSpringBootStatusExt on EYRSpringBoot {
  String get code => switch (this) {
        EYRSpringBoot.ezwt0000 => 'EZWT0000',
      };

  static EYRSpringBoot? get(String code) => switch (code) {
        'EZWT0000' => EYRSpringBoot.ezwt0000,
        _ => null,
      };
}
