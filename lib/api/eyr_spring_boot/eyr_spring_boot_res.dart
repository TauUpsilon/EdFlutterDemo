import 'package:eyr/api/api_service.dart';

class EYRSpringBootRes<T> extends ApiResponse<T> {
  EYRSpringBootRes({
    required super.uri,
    required super.status,
    required super.data,
  });
}
