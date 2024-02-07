part of 'auth_cubit.dart';

@immutable
sealed class AuthState with EquatableMixin {
  final bool isAuthenticated;

  const AuthState({
    required this.isAuthenticated,
  });

  factory AuthState.init() => const AuthInstance(
        isAuthenticated: false,
      );

  factory AuthState.copyWith({
    required bool isAuthenticated,
  }) =>
      AuthInstance(
        isAuthenticated: isAuthenticated,
      );
}

final class AuthInstance extends AuthState {
  const AuthInstance({
    required super.isAuthenticated,
  });

  @override
  List<Object?> get props => [
        super.isAuthenticated,
      ];
}
