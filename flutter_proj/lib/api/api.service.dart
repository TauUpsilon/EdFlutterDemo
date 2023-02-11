import 'dart:convert';

import 'package:flutter_proj/shared/objects/common_error.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';

import 'package:flutter_proj/app/app.util.dart';
import 'package:flutter_proj/api/api.request.dart';
import 'package:flutter_proj/shared/enums/common.status.dart';
import 'package:flutter_proj/core/app.service.dart';
import 'package:flutter_proj/api/api_model.service.dart';
import 'package:flutter_proj/config/app.config.dart';

class ApiService extends AppService {
  final modelService = GetIt.instance.get<ApiModelService>();
  final baseUrl = AppConfig.baseUrl;

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<ApiModelService> request(ApiRequest request) async {
    var url = Uri.parse('$baseUrl/${request.header.txId}');
    var response = await _doRequest(url, request);

    modelService.model = response;

    return modelService;
  }

  Future<Map<String, dynamic>> _doRequest(
    Uri url,
    ApiRequest request,
  ) async {
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
    String returnCode = response.statusCode.toString().trim();

    // 200
    if (returnCode.startsWith("2")) {
      var res = jsonDecode(response.body) as Map<String, dynamic>;

      loggingService.d(AppUtil.getJsonString(res));

      return {
        "status": CommonStatus.done,
        "returnCode": response.statusCode.toString(),
        "data": res,
        "error": null,
      };

      // 500
    } else if (returnCode.startsWith("5")) {
      return {
        "status": CommonStatus.fail,
        "returnCode": response.statusCode.toString(),
        "data": null,
        "error": CommonError(
          errorCode: returnCode,
          message: "Server Issue",
        ),
      };
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }
}
