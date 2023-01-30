import 'package:flutter_proj/shared/services/api.service.dart';
import 'package:flutter_proj/shared/services/logging.service.dart';
import 'package:get_it/get_it.dart';

class BaseService {
  final loggingService = GetIt.instance.get<LoggingService>();
}
