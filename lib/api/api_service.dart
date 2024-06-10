import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/utils/string_util.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_enum.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_view.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_enum.dart';
part 'api_exception.dart';
part 'api_request.dart';
part 'api_response.dart';

class ApiService {
  EnvCubit get _envCubit => GetIt.I<EnvCubit>();
  AppMaskCubit get _maskCubit => GetIt.I<AppMaskCubit>();
  LoggingService get _logger => GetIt.I<LoggingService>();
  Connectivity get _connectivity => GetIt.I<Connectivity>();

  Future<ApiResponse<T>> request<T>(
    ApiRequest request,
    T Function(Object value) serialiser, {
    bool hasMask = true,
  }) async =>
      _handleMask(request, AppMaskStatus.on, hasMask)
          .then((_) => _handleRequest<T>(request))
          .then((response) => _handleRespose<T>(request, response, serialiser))
          .onError<Exception>((err, stack) => _handleError(request, err, stack))
          .whenComplete(
            () => _handleMask(request, AppMaskStatus.off, hasMask),
          );

  Future<Response> _handleRequest<T>(
    ApiRequest request,
  ) async =>
      _connectivity
          .checkConnectivity()
          .then((_) => _logger.t('ApiService $request'))
          .then(
            (_) => switch (request.method) {
              ApiMethod.post => post(
                  request.reqURI,
                  headers: request.reqHeader,
                  body: request.reqBody,
                ),
              ApiMethod.get => get(
                  request.reqURI,
                ),
            },
          )
          .timeout(Duration(seconds: _envCubit.state.apiTimeout));

  ApiResponse<T> _handleRespose<T>(
    ApiRequest request,
    Response response,
    T Function(Object value) serialiser,
  ) {
    final status = '${response.statusCode}'.trim();
    final from = '${request.reqURI}'.trim();
    final reason = response.reasonPhrase;

    if (status.startsWith('2')) {
      return request.handleResponse<T>(response, serialiser);
    } else if (status.startsWith('5')) {
      throw ServerException(status, from, reason);
    } else if (status.startsWith('4')) {
      throw ClientException(status, from, reason);
    } else {
      throw UnknownException(status, from, reason);
    }
  }

  ApiResponse<T> _handleError<T>(
    ApiRequest request,
    Exception error,
    StackTrace stackTrace,
  ) {
    final customErr = request.handleError(error);
    if (customErr != null) throw customErr;
    _logger.e('ApiService $error\n\n$stackTrace');
    throw error;
  }

  Future<void> _handleMask(
    ApiRequest request,
    AppMaskStatus status, [
    bool hasMask = true,
  ]) async {
    if (!hasMask) return;

    switch (status) {
      case AppMaskStatus.on:
        _maskCubit.addMaskClient(request.reqURI.toString());
      case AppMaskStatus.off:
        _maskCubit.popMaskClient(request.reqURI.toString());
    }
  }
}
