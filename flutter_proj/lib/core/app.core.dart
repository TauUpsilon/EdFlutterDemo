import 'package:flutter_proj/shared/services/logging.service.dart';
import 'package:get_it/get_it.dart';

class AppCore {
  final loggingService = GetIt.instance.get<LoggingService>();
}
