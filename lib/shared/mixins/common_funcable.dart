import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/widgets/app_alert/app_alert_view.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_view.dart';
import 'package:eyr/states/locale/locale_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

mixin CommonFuncable {
  LoggingService get logger => GetIt.I<LoggingService>();
  GoRouter get router => GetIt.I<GoRouter>();
  LocaleCubit get localeCubit => GetIt.I<LocaleCubit>();
  AppMaskCubit get maskCubit => GetIt.I<AppMaskCubit>();
  AppAlertCubit get alertCubit => GetIt.I<AppAlertCubit>();
}
