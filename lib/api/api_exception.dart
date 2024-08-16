part of 'api_service.dart';

class ApiException implements Exception {
  final String? status;
  final String? from;
  final Response? response;

  ApiException({
    this.status,
    this.from,
    this.response,
  });

  Map<String, dynamic> get error {
    final body = jsonDecode(response?.body ?? '') as Map<String, dynamic>;
    return body['error'] as Map<String, dynamic>;
  }

  List<String> get stack {
    return (error['stacktrace'] as String)
        .replaceAll(RegExp(r'[\[\]]'), '')
        .split(',');
  }

  String toLog() {
    return StringUtil.prettyLog(
      'Error -> $runtimeType',
      {
        'Status': status,
        'From': from,
        'Reason': response?.reasonPhrase,
      },
    );
  }

  StackTrace? toCrashlytics() {
    final errList = List.generate(
      stack.length,
      (i) => '#$i ${stack[i].trim()}'.replaceAll(RegExp(r'\('), ' ('),
    );

    if (from == null || errList.isEmpty) return null;

    return StackTrace.fromString(
      errList.length >= 5
          ? errList.sublist(0, 5).join('\n')
          : errList.join('\n'),
    );
  }

  @override
  String toString() => 'ApiException: ${response?.reasonPhrase}';
}

class ServerException extends ApiException {
  ServerException({super.status, super.from, super.response});
}

class ClientException extends ApiException {
  ClientException({super.status, super.from, super.response});
}

class CryptoExpiredException extends ApiException {
  CryptoExpiredException({super.status, super.from, super.response});
}

class UnknownException extends ApiException {
  UnknownException({super.status, super.from, super.response});
}
