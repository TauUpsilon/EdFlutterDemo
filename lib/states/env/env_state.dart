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

  EnvState copyWith({
    String? appEnv,
    String? appName,
    int? apiTimeout,
    String? apiDomain,
  }) =>
      EnvInstance(
        appEnv: appEnv ?? this.appEnv,
        appName: appName ?? this.appName,
        apiTimeout: apiTimeout ?? this.apiTimeout,
        apiDomain: apiDomain ?? this.apiDomain,
      );

  @override
  List<Object?> get props => [
        appEnv,
        appName,
        apiTimeout,
        apiDomain,
      ];
}

final class EnvInstance extends EnvState {
  const EnvInstance({
    required super.appEnv,
    required super.appName,
    required super.apiTimeout,
    required super.apiDomain,
  });
}
