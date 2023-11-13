import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/shares/services/logging.service.dart';
import 'package:flutter_proj/states/cubit/mask/mask_cubit.dart';
import 'package:get_it/get_it.dart';

mixin CommonFunctionable {
  LoggingService get logger => GetIt.I<LoggingService>();
  AppRouter get router => GetIt.I<AppRouter>();

  // Global Cubits
  MaskCubit get maskCubit => GetIt.I<MaskCubit>();
}
