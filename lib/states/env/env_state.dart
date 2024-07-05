part of 'env_cubit.dart';

@immutable
sealed class EnvState with EquatableMixin {
  final String appEnv;
  final String appName;

  final String apiEyrDomain;
  final int apiTimeout;

  final bool cryptoEnabled;
  final String cryptoAesAg;

  const EnvState({
    required this.appEnv,
    required this.appName,
    required this.apiEyrDomain,
    required this.apiTimeout,
    required this.cryptoEnabled,
    required this.cryptoAesAg,
  });

  factory EnvState.init() => const EnvInstance(
        appEnv: '',
        appName: '',
        apiTimeout: 0,
        apiEyrDomain: '',
        cryptoEnabled: false,
        cryptoAesAg: '',
      );

  EnvState copyWith({
    String? appEnv,
    String? appName,
    int? apiTimeout,
    String? apiEyrDomain,
    bool? cryptoEnabled,
    String? cryptoAesAg,
  }) =>
      EnvInstance(
        appEnv: appEnv ?? this.appEnv,
        appName: appName ?? this.appName,
        apiTimeout: apiTimeout ?? this.apiTimeout,
        apiEyrDomain: apiEyrDomain ?? this.apiEyrDomain,
        cryptoEnabled: cryptoEnabled ?? this.cryptoEnabled,
        cryptoAesAg: cryptoAesAg ?? this.cryptoAesAg,
      );

  @override
  List<Object?> get props => [
        appEnv,
        appName,
        apiTimeout,
        apiEyrDomain,
      ];
}

final class EnvInstance extends EnvState {
  const EnvInstance({
    required super.appEnv,
    required super.appName,
    required super.apiTimeout,
    required super.apiEyrDomain,
    required super.cryptoEnabled,
    required super.cryptoAesAg,
  });
}
