part of 'api.service.dart';

enum ApiMethod {
  get,
  post,
}

extension CustomString on ApiModel {
  String get name => toString().split('.').last;
}
