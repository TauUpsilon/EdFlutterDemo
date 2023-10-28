import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:flutter_proj/shares/enums/common.enum.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

part 'api.constant.dart';
part 'api.enum.dart';
part 'api.error.dart';
part 'api.model.dart';
part 'api.request.dart';
part 'api_common.request.dart';
part 'api_model.service.dart';

class ApiService with AlphaBase {
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

  Future<ApiModel<dynamic>> _doRequest(
    ApiRequest request,
  ) async {
    return _connectivity
        .checkConnectivity()
        .then((value) => _handleRequest(request))
        .timeout(Duration(seconds: AppConfig.timeoutSec))
        .then((response) => _handleRespose(request, response))
        .catchError(_handleError);
  }

  Future<Response> _handleRequest(
    ApiRequest request,
  ) async {
    final uri = _handleURI(request);
    final headers = _handleHeaders(request);
    final body = _handleBody(request);

    logger
      ..d(
        '$runtimeType - Request Info\n\n$request',
      )
      ..d(
        '$runtimeType - Request Headers\n\n${AppUtil.getJsonString(headers)}',
      )
      ..d(
        '''$runtimeType - Request Body or QueryParams\n\n${AppUtil.getJsonString(request.reqBody)}''',
      )
      ..d(
        '''$runtimeType - Start to request for ${AppConfig.timeoutSec} seconds\n\nURI: $uri''',
      );

    switch (request.reqMethod) {
      case ApiMethod.post:
        return post(
          uri,
          headers: headers,
          body: body,
        );
      case ApiMethod.get:
        return get(uri);
    }
  }

  Uri _handleURI(ApiRequest request) {
    if (request is JsonPlaceholderRequest) {
      return Uri.parse('$_baseUrl/${request.reqApi}').replace(
        queryParameters: request.reqBody,
      );
    } else {
      return Uri.parse(_baseUrl);
    }
  }

  Map<String, String> _handleHeaders(ApiRequest request) {
    final headers = request.reqHeaders;

    if (headers != null && headers.isNotEmpty) {
      return headers;
    } else {
      return {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
    }
  }

  String _handleBody(ApiRequest request) {
    if (request is JsonPlaceholderRequest) {
      return jsonEncode(request.reqBody);
    } else {
      return '';
    }
  }

  ApiModel<dynamic> _handleRespose(
    ApiRequest request,
    Response response,
  ) {
    final status = response.statusCode.toString().trim();

    if (status.startsWith('2')) {
      // 200
      return _handleSuccess(request, status, response);
    } else if (status.startsWith('5')) {
      // 500
      throw ServerException();
    } else {
      throw UnknownResException('Unknown status code: $status');
    }
  }

  ApiModel<dynamic> _handleSuccess(
    ApiRequest request,
    String status,
    Response response,
  ) {
    final body = jsonDecode(response.body);

    logger
      ..d('$runtimeType - Response Body\n\n${AppUtil.getJsonString(body)}')
      ..d('$runtimeType - Response Status\n\nHttp Res Code: $status');

    if (request is JsonPlaceholderRequest) {
      return ApiDone(
        code: status, // Could be custom return code
        value: body,
      );
    } else {
      return ApiDone(
        code: status,
        value: body,
      );
    }
  }

  ApiFail _handleError(Object error) {
    final errStr = AppUtil.splitStringIntoLines(error.toString(), 100);

    logger.e(
      '',
      error: '$runtimeType - Error Response\n\n$errStr',
    );

    if (error is SocketException) {
      return ApiErrorInstance.offline;
    } else if (error is ServerException) {
      return ApiErrorInstance.serverIssue;
    } else if (error is TimeoutException) {
      return ApiErrorInstance.timeout;
    } else {
      return ApiErrorInstance.uknownError;
    }
  }

  void _handleMask(
    ApiRequest request, {
    MaskStatus maskStatus = MaskStatus.show,
  }) {
    switch (maskStatus) {
      case MaskStatus.show:
        if (_modelService.model is ApiLoading) {
          addMask(_handleURI(request).toString());
        } else {
          removeMask(_handleURI(request).toString());
        }

      case MaskStatus.hide:
        break;
    }
  }
}
