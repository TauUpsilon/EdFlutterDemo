part of 'env_cubit.dart';

@immutable
sealed class EnvState with EquatableMixin {
  final String appEnv;
  final String appName;
  final int apiTimeout;
  final String apiDomain;

  const EnvState({
    required this.appEnv,
    required this.appName,
    required this.apiTimeout,
    required this.apiDomain,
  });

  factory EnvState.init() => const EnvInstance(
        appEnv: '',
        appName: '',
        apiTimeout: 0,
        apiDomain: '',
      );

  factory EnvState.copyWith({
    required String appEnv,
    required String appName,
    required int apiTimeout,
    required String apiDomain,
  }) =>
      EnvInstance(
        appEnv: appEnv,
        appName: appName,
        apiTimeout: apiTimeout,
        apiDomain: apiDomain,
      );
}

final class EnvInstance extends EnvState {
  const EnvInstance({
    required super.appEnv,
    required super.appName,
    required super.apiTimeout,
    required super.apiDomain,
  });

  @override
  List<Object?> get props => [
        super.appEnv,
        super.appName,
        super.apiTimeout,
        super.apiDomain,
      ];
}
