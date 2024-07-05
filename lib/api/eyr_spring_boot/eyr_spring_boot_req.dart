part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

class EYRSpringBootReq extends ApiRequest {
  final _logger = GetIt.I<LoggingService>();
  final _env = GetIt.I<EnvCubit>();

  EYRSpringBootReq({
    required super.method,
    required super.uri,
  });

  @override
  Uri get reqURI {
    final url = 'http://${_env.state.apiEyrDomain}/api/v1/$uri';

    return switch (method) {
      ApiMethod.get => Uri.parse(url).replace(
          queryParameters: toJson(),
        ),
      ApiMethod.post => Uri.parse(url),
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
}
