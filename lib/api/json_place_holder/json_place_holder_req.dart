import 'dart:convert';

import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/json_place_holder/json_place_holder_exc.dart';
import 'package:eyr/api/json_place_holder/json_place_holder_res.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class JsonPlaceHolderReq extends ApiRequest {
  LoggingService get _logger => GetIt.I<LoggingService>();
  EnvCubit get _envCubit => GetIt.I<EnvCubit>();

  JsonPlaceHolderReq({
    required super.method,
    required super.uri,
  });

  @override
  Uri get reqURI {
    return Uri.parse(
      '${_envCubit.state.apiDomain}/$uri',
    ).replace(
      queryParameters: toJson(),
    );
  }

  @override
  Map<String, String> get reqHeader {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }

  @override
  String? get reqBody => jsonEncode(toJson());

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => throw UnimplementedError();

  @override
  ApiResponse<T> handleResponse<T>(
    Response response,
    T Function(Object value) serialiser,
  ) {
    final resJson = jsonDecode(response.body);
    // final status = EzwtStatusExt.get(resJson['code']);

    // if resJson['code'] != EzwtStatus.ezwt0000.code {
    //   throw EzwtExc(
    //     resJson['code'],
    //     '$reqURI',
    //     resJson['reason'],
    //     resJson['stackTrace']
    //   );
    // }

    // return EzwtRes<T>(
    //   uri: reqURI,
    //   status: resJson['code'],
    //   data: serialiser(resJson['data']),
    // );

    return JsonPlaceHolderRes<T>(
      uri: reqURI,
      status: '${response.statusCode}',
      data: serialiser(resJson),
    );
  }

  @override
  ApiException? handleError(
    Exception error,
  ) {
    if (error is! JsonPlaceHolderExc) return null;
    _logger.e('JsonPlaceHolder $error\n\n${error.stackTrace}');
    return error;
  }
}
