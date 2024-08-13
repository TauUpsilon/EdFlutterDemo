import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'env_state.dart';

class EnvCubit extends Cubit<EnvState> {
  EnvCubit() : super(EnvState.init());

  void loadEnv() {
    const appEnv = String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'DEV',
    );

    const appName = String.fromEnvironment(
      'APP_NAME',
      defaultValue: 'MyApp',
    );

    const apiTimeout = int.fromEnvironment(
      'API_TIMEOUT',
      defaultValue: 1,
    );

    final apiEyrDomain = appEnv == 'DEV' && Platform.isAndroid
        ? '10.0.2.2:8080'
        : const String.fromEnvironment(
            'API_EYR_DOMAIN',
          );

    const cryptoEnabled = bool.fromEnvironment(
      'CRYPTO_ENABLE',
    );

    const cryptoAesAg = String.fromEnvironment(
      'CRYPTO_AES_AG',
    );

    emit(
      state.copyWith(
        appEnv: appEnv,
        appName: appName,
        apiTimeout: apiTimeout,
        apiEyrDomain: apiEyrDomain,
        cryptoEnabled: cryptoEnabled,
        cryptoAesAg: cryptoAesAg,
      ),
    );
  }
}
