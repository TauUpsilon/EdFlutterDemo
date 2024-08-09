import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/utils/string_util.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_enum.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:eyr/states/mask/mask_cubit.dart';
import 'package:eyr/states/mask/mask_enum.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_enum.dart';
part 'api_exception.dart';
part 'api_request.dart';
part 'api_response.dart';

class ApiService {
  final _envCubit = GetIt.I<EnvCubit>();
  final _maskCubit = GetIt.I<MaskCubit>();
  final _logger = GetIt.I<LoggingService>();
  final _connectivity = GetIt.I<Connectivity>();

  Future<ApiResponse<T>> request<T>(
    ApiRequest request,
    T Function(Map<String, dynamic> value) serialiser, {
    bool hasMask = true,
  }) async =>
      _handleMask(request, AppMaskStatus.on, hasMask)
          .then(
            (_) => _handleRequest<T>(request),
          )
          .then(
            (response) => _handleRespose<T>(
              request,
              response,
              serialiser,
            ),
          )
          .onError<Exception>(
            (err, stack) => _handleError(
              err,
              request,
              serialiser,
              hasMask: hasMask,
            ),
          )
          .whenComplete(
            () => _handleMask(
              request,
              AppMaskStatus.off,
              hasMask,
            ),
          );

  Future<Response> _handleRequest<T>(
    ApiRequest request,
  ) async =>
      _connectivity
          .checkConnectivity()
          .then((_) => _logger.t('$runtimeType $request'))
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
    Response res,
    T Function(Map<String, dynamic> value) serialiser,
  ) {
    final status = '${res.statusCode}'.trim();
    final from = '${request.reqURI}'.trim();

    if (status.startsWith('200')) {
      final response = request.handleResponse<T>(res, serialiser);
      _logger.d('$runtimeType $response');
      return response;
    } else if (status.startsWith('400')) {
      throw ClientException(status: status, from: from, response: res);
    } else if (status.startsWith('420')) {
      throw CryptoExpiredException(status: status, from: from, response: res);
    } else if (status.startsWith('500')) {
      throw ServerException(status: status, from: from, response: res);
    } else {
      throw UnknownException(status: status, from: from, response: res);
    }
  }

  Future<ApiResponse<T>> _handleError<T>(
    Exception error,
    ApiRequest request,
    T Function(Map<String, dynamic> value) serialiser, {
    bool hasMask = true,
  }) async {
    try {
      final errorResult = await request.handleError<T>(
        error,
        () => this.request<T>(
          request,
          serialiser,
          hasMask: hasMask,
        ),
      );

      if (errorResult != null) {
        return errorResult;
      }

      throw error;
    } on ApiException {
      rethrow;
    }
  }

  Future<void> _handleMask(
    ApiRequest request,
    AppMaskStatus status, [
    bool hasMask = true,
  ]) async {
    if (!hasMask) return;

    switch (status) {
      case AppMaskStatus.on:
        _maskCubit.addMaskClient('${request.reqURI}', type: MaskType.loading);
      case AppMaskStatus.off:
        _maskCubit.popMaskClient('${request.reqURI}');
    }
  }
}
