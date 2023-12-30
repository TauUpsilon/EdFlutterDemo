import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shares/enums/common.enum.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/utils/string.util.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

part 'api.constant.dart';
part 'api.enum.dart';
part 'api.error.dart';
part 'api.model.dart';
part 'api.modeller.dart';
part 'api.request.dart';
part 'api_common.request.dart';

class ApiService with CommonFunctionable {
  Connectivity get _connectivity => GetIt.I<Connectivity>();

  Stream<ApiModeller> request<T>(
    ApiRequest request, {
    MaskStatus maskStatus = MaskStatus.show,
  }) async* {
    final apiModeller = ApiModeller(
      model: ApiLoading<T>(),
    );

    yield apiModeller;
    _handleMask<T>(request, apiModeller.model, maskStatus: maskStatus);

    apiModeller.model = await _doRequest(request);

    yield apiModeller;
    _handleMask<T>(request, apiModeller.model, maskStatus: maskStatus);
  }

  Future<ApiModel> _doRequest(
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
    logger
      ..d(
        '$runtimeType - Request Info\n\n$request',
      )
      ..d(
        '''$runtimeType - Request Headers\n\n${StringUtil.formateStrAsJson(request.reqHeader)}''',
      )
      ..d(
        '''$runtimeType - Request Body or QueryParams\n\n${StringUtil.formateStrAsJson(request.body)}''',
      )
      ..d(
        '''$runtimeType - Start to request for ${AppConfig.timeoutSec} seconds\n\nURI: ${request.reqURI}''',
      );

    switch (request.method) {
      case ApiMethod.post:
        return post(
          request.reqURI,
          headers: request.reqHeader,
          body: request.reqBody,
        );
      case ApiMethod.get:
        return get(request.reqURI);
    }
  }

  ApiModel _handleRespose(
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

  ApiModel _handleSuccess(
    ApiRequest request,
    String status,
    Response response,
  ) {
    final body = jsonDecode(response.body);

    logger
      ..d('''$runtimeType - Response Body\n\n${StringUtil.formateStrAsJson(body)}''')
      ..d('''$runtimeType - Response Status\n\nHttp Res Code: $status''');

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
    final errStr = StringUtil.splitStrIntoLines(error.toString(), 100);

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

  void _handleMask<T>(
    ApiRequest request,
    ApiModel model, {
    MaskStatus maskStatus = MaskStatus.show,
  }) {
    switch (maskStatus) {
      case MaskStatus.show:
        if (model is ApiLoading<T>) {
          maskCubit.addMaskClient(request.reqURI.toString());
        } else {
          maskCubit.popMaskClient(request.reqURI.toString());
        }

      case MaskStatus.hide:
        break;
    }
  }
}
