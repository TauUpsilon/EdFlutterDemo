import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'env_state.dart';

class EnvCubit extends Cubit<EnvState> {
  EnvCubit() : super(EnvState.init());

  void loadEnv() {
    emit(
      state.copyWith(
        appEnv: const String.fromEnvironment(
          'APP_ENV',
          defaultValue: 'LOCAL',
        ),
        appName: const String.fromEnvironment(
          'APP_NAME',
          defaultValue: 'MyApp',
        ),
        apiTimeout: const int.fromEnvironment(
          'API_TIMEOUT',
          defaultValue: 1,
        ),
        apiDomain: const String.fromEnvironment(
          'API_DOMAIN',
          defaultValue: 'MyDomain',
        ),
      ),
    );
  }
}
