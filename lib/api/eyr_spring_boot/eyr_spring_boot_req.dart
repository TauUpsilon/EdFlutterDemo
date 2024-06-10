import 'dart:convert';
import 'dart:typed_data';

import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_exc.dart';
import 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_res.dart';
import 'package:eyr/shared/services/crypto_service.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class EYRSpringBootReq extends ApiRequest {
  LoggingService get _logger => GetIt.I<LoggingService>();

  EYRSpringBootReq({
    required super.method,
    required super.uri,
  });

  @override
  Uri get reqURI {
    return switch (method) {
      ApiMethod.get => Uri.parse(
          'http://localhost:8080/api/v1/$uri',
          // 'http://10.0.2.2:8080/api/v1/$uri',
        ).replace(
          queryParameters: toJson(),
        ),
      _ => Uri.parse(
          'http://localhost:8080/api/v1/$uri',
          // 'http://10.0.2.2:8080/api/v1/$uri',
        ),
    };
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

    return EYRSpringBootRes<T>(
      uri: reqURI,
      status: '${response.statusCode}',
      data: serialiser(resJson),
    );
  }

  @override
  ApiException? handleError(
    Exception error,
  ) {
    if (error is! EYRSpringBootExc) return null;
    _logger.e('EYRSpringBoot $error\n\n${error.stackTrace}');
    return error;
  }

  static String doCryptoEncryptionToJsonKey(String value) {
    final cryptoService = GetIt.I<CryptoService>();
    final key = Uint8List(16);
    final encryptedData = cryptoService.doAESEncryption(
      utf8.encode(value),
      key,
    );
    final encryptedKey = cryptoService.doRSAEncryption(
      key,
    );
    return base64.encode(
      Uint8List.fromList(
        [encryptedKey, encryptedData].expand((x) => x).toList(),
      ),
    );
  }
}
