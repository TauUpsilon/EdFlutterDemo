import 'package:eyr/app/app.widget.dart';
import 'package:eyr/shares/services/logging.service.dart';
import 'package:eyr/shares/services/rsa.service.dart';
import 'package:eyr/states/cubit/mask/mask_cubit.dart';
import 'package:get_it/get_it.dart';

mixin CommonFunctionable {
  LoggingService get logger => GetIt.I<LoggingService>();
  RsaService get rsaService => GetIt.I<RsaService>();
  AppRouter get router => GetIt.I<AppRouter>();

  // Global Cubits
  MaskCubit get maskCubit => GetIt.I<MaskCubit>();
}
