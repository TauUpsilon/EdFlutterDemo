import 'package:project/shared/models/meta.model.dart';

class ApiResponse<T> {
  ResponseStatus status;
  ResponseBody<T> body;

  ApiResponse({this.status, this.body});

  factory ApiResponse.initial() =>
      ApiResponse(status: null, body: ResponseBody.initial());

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      ApiResponse(status: null, body: ResponseBody.fromJson(json));
}

enum ResponseStatus { SUCCESS, FAILURE, LOADING }

class ResponseBody<T> {
  Meta meta;
  List<T> data;

  ResponseBody({this.meta, this.data});

  factory ResponseBody.initial() => ResponseBody(meta: new Meta(), data: []);

  factory ResponseBody.fromJson(Map<String, dynamic> json) =>
      ResponseBody(meta: Meta.fromJson(json['meta']), data: json['data']);
}
