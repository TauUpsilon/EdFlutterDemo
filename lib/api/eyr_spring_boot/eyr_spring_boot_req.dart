part of 'package:eyr/api/eyr_spring_boot/eyr_spring_boot_service.dart';

class EYRSpringBootReq extends ApiRequest {
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
    T Function(Map<String, dynamic> value) serialiser,
  ) {
    final resJson = jsonDecode(response.body) as Map<String, dynamic>;

    return EYRSpringBootRes<T>(
      uri: reqURI,
      status: '${response.statusCode}',
      data: serialiser(resJson['payload']),
    );
  }

  @override
  ApiException? handleError(
    Exception error,
  ) {
    if (error is! ApiException) return null;

    return EYRSpringBootExc(
      status: error.status,
      from: error.from,
      response: error.response,
    );
  }
}
