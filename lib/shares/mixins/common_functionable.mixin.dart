import 'package:eyr/shares/services/logging.service.dart';
import 'package:eyr/shares/services/rsa.service.dart';
import 'package:eyr/states/cubit/mask/mask_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

mixin CommonFunctionable {
  LoggingService get logger => GetIt.I<LoggingService>();
  RsaService get rsaService => GetIt.I<RsaService>();
  GoRouter get router => GetIt.I<GoRouter>();

  // Global Cubits
  MaskCubit get maskCubit => GetIt.I<MaskCubit>();
}
