import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha.mixin.dart';
import 'package:flutter_proj/shares/enums/common.enum.dart';
import 'package:flutter_proj/states/redux/mask_store/mask.reducer.dart';
import 'package:http/http.dart';

part 'api.constant.dart';
part 'api.enum.dart';
part 'api.error.dart';
part 'api.model.dart';
part 'api.modeller.dart';
part 'api.request.dart';
part 'api_common.request.dart';

class ApiService with Alpha, MaskActions {
  Connectivity get _connectivity => injector.get<Connectivity>();

  Stream<ApiModeller> request(
    ApiRequest request, {
    MaskStatus maskStatus = MaskStatus.show,
  }) async* {
    final apiModeller = ApiModeller(
      model: ApiCommonConst.apiInstances.loading,
    );

    yield apiModeller;
    _handleMask(request, apiModeller.model, maskStatus: maskStatus);

    apiModeller.model = await _doRequest(request);
    yield apiModeller;
    _handleMask(request, apiModeller.model, maskStatus: maskStatus);
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
      return Uri.parse('${AppConfig.jsonPlaceholderBaseUrl}/${request.reqApi}')
          .replace(
        queryParameters: request.reqBody,
      );
    } else {
      return Uri.parse(AppConfig.jsonPlaceholderBaseUrl);
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
      return ApiCommonConst.apiErrorInstances.offline;
    } else if (error is ServerException) {
      return ApiCommonConst.apiErrorInstances.serverIssue;
    } else if (error is TimeoutException) {
      return ApiCommonConst.apiErrorInstances.timeout;
    } else {
      return ApiCommonConst.apiErrorInstances.uknownError;
    }
  }

  void _handleMask(
    ApiRequest request,
    ApiModel model, {
    MaskStatus maskStatus = MaskStatus.show,
  }) {
    switch (maskStatus) {
      case MaskStatus.show:
        if (model is ApiLoading) {
          addMask(_handleURI(request).toString());
        } else {
          removeMask(_handleURI(request).toString());
        }

      case MaskStatus.hide:
        break;
    }
  }
}
