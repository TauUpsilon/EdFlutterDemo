import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_proj/api/core/base_api.request.dart';
import 'package:flutter_proj/app/app.config.dart';

class BaseApiService {
  final String baseUrl = AppConfig.baseUrl;

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<T> request<T>(BaseApiRequest request) async {
    var url = Uri.parse('$baseUrl/${request.header.txId}');
    var response = await _doRequest(url, request);

    return request.responseToModel<T>(response);
  }

  Future<Map<String, dynamic>> _doRequest(
      Uri url, BaseApiRequest request) async {
    http.Response res;

    switch (request.method) {
      case 'POST':
        res = await http.post(
          url,
          headers: headers,
          body: jsonEncode(request.toJson()),
        );

        break;

      default:
        res = await http.get(url);

        break;
    }

    return _handleRespose(res);
  }

  Future<Map<String, dynamic>> _handleRespose(http.Response response) {
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body) as Map<String, dynamic>;

      return Future.value(res);
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }
}
