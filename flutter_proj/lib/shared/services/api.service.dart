import 'dart:convert';

import 'package:flutter_proj/app/app.util.dart';
import 'package:flutter_proj/core/api.request.dart';
import 'package:flutter_proj/core/base.service.dart';
import 'package:flutter_proj/shared/services/model.service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_proj/config/app.config.dart';

class ApiService extends BaseService {
  final modelService = GetIt.instance.get<ModelService>();
  final baseUrl = AppConfig.baseUrl;

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<ModelService> request(ApiRequest request) async {
    var url = Uri.parse('$baseUrl/${request.header.txId}');
    var response = await _doRequest(url, request);

    modelService.model = response;

    return modelService;
  }

  Future<Map<String, dynamic>> _doRequest(Uri url, ApiRequest request) async {
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

  Map<String, dynamic> _handleRespose(http.Response response) {
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body) as Map<String, dynamic>;

      loggingService.d(AppUtil.getJsonString(res));

      return res;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }
}
