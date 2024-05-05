part of 'login_view.dart';

@immutable
sealed class LoginState with EquatableMixin {
  final PasswordField passwordField;

  LoginState({
    required this.passwordField,
  });

  factory LoginState.init() => LoginInstance(
        passwordField: const PasswordField.pure(),
      );

  LoginState copyWith({
    PasswordField? passwordField,
  }) =>
      LoginInstance(
        passwordField: passwordField ?? this.passwordField,
      );
}

final class LoginInstance extends LoginState {
  LoginInstance({
    required super.passwordField,
  });

  @override
  List<Object?> get props => [
        passwordField,
      ];
}
