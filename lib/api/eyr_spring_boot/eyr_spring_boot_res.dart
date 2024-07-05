part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

class EYRSpringBootRes<T> extends ApiResponse<T> {
  EYRSpringBootRes({
    required super.uri,
    required super.status,
    required super.data,
  });
}
