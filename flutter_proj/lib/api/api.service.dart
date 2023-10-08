import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha.core.dart';
import 'package:flutter_proj/shares/enums/common.enum.dart';
import 'package:flutter_proj/shares/instances/common.instance.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

part 'api.constant.dart';
part 'api.enum.dart';
part 'api.error.dart';
part 'api.model.dart';
part 'api.request.dart';
part 'api_common.request.dart';
part 'api_model.service.dart';

class ApiService extends AlphaCore {
  final _baseUrl = AppConfig.jsonPlaceholderBaseUrl;

  final _connectivity = GetIt.instance.get<Connectivity>();
  final _modelService = GetIt.instance.get<ApiModelService>();

  Stream<ApiModelService> request(
    ApiRequest request, {
    MaskStatus maskStatus = MaskStatus.show,
  }) async* {
    _modelService.model = ApiCommonInstance.loading;
    yield _modelService;
    _handleMask(request, maskStatus: maskStatus);

    _modelService.model = await _doRequest(request);
    yield _modelService;
    _handleMask(request, maskStatus: maskStatus);
  }

  Future<Map<String, dynamic>> _doRequest(
    ApiRequest request,
  ) async {
    return _connectivity
        .checkConnectivity()
        .then((value) => _handleRequest(request))
        .timeout(Duration(seconds: AppConfig.timeoutSec))
        .then((response) => _handleRespose(request, response))
        .catchError((error) => _handleError(error));
  }

  Future<Response> _handleRequest(
    ApiRequest request,
  ) async {
    var url = _handleURI(request);
    var headers = _handleHeaders(request);
    var body = _handleBody(request);

    switch (request.method) {
      case ApiMethod.post:
        return post(
          url,
          headers: headers,
          body: body,
        );

      default:
        return get(url);
    }
  }

  Uri _handleURI(ApiRequest request) {
    if (request is JsonPlaceholderRequest) {
      return Uri.parse('$_baseUrl/${request.apiId}');
    } else {
      return Uri.parse(_baseUrl);
    }
  }

  Map<String, String> _handleHeaders(ApiRequest request) {
    if (request is JsonPlaceholderRequest) {
      return {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
    } else {
      return {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
    }
  }

  String _handleBody(ApiRequest request) {
    if (request is JsonPlaceholderRequest) {
      return jsonEncode(request.body);
    } else {
      return '';
    }
  }

  Map<String, dynamic> _handleRespose(
    ApiRequest request,
    Response response,
  ) {
    var status = response.statusCode.toString().trim();

    if (status.startsWith('2')) {
      // 200
      return _handleSuccess(request, status, jsonDecode(response.body));
    } else if (status.startsWith('5')) {
      // 500
      throw ServerError();
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }

  Map<String, dynamic> _handleSuccess(
    ApiRequest request,
    String status,
    dynamic body,
  ) {
    logger.d(AppUtil.getJsonString(body));

    if (request is JsonPlaceholderRequest) {
      return {
        'status': LoadingStatus.loaded,
        'value': {
          'code': status,
          'data': body,
        },
        'error': null,
      };
    } else {
      return {
        'status': LoadingStatus.loaded,
        'value': {
          'code': status,
          'data': body,
        },
        'error': null,
      };
    }
  }

  Map<String, dynamic> _handleError(dynamic error) {
    if (error is SocketException) {
      return ApiErrorInstance.offline;
    } else if (error is ServerError) {
      return ApiErrorInstance.serverIssue;
    } else if (error is TimeoutException) {
      return ApiErrorInstance.timeout;
    } else {
      return {};
    }
  }

  void _handleMask(ApiRequest request, {MaskStatus maskStatus = MaskStatus.show}) {
    switch (maskStatus) {
      case MaskStatus.show:
        if (_modelService._model["status"] == LoadingStatus.loading) {
          addMask(_handleURI(request).toString());
        } else {
          removeMask(_handleURI(request).toString());
        }

        break;
      default:
        break;
    }
  }
}
