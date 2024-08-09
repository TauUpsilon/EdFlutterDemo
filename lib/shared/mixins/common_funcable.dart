import 'package:eyr/shared/services/logging_service.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

mixin CommonFuncable {
  final logger = GetIt.I<LoggingService>();
  final router = GetIt.I<GoRouter>();
}
