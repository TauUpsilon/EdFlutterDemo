import 'package:eyr/api/api_service.dart';

class JsonPlaceHolderRes<T> extends ApiResponse<T> {
  JsonPlaceHolderRes({
    required super.uri,
    required super.status,
    required super.data,
  });
}
