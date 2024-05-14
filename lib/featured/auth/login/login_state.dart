part of 'login_view.dart';

@immutable
sealed class LoginState with EquatableMixin {
  final PasswordField passwordField;

  LoginState({
    required this.passwordField,
  });

  factory LoginState.init() => LoginInstance(
        passwordField: PasswordField.init(),
      );

  LoginState copyWith({
    PasswordField? passwordField,
  }) =>
      LoginInstance(
        passwordField: passwordField ?? this.passwordField,
      );

  @override
  List<Object?> get props => [
        passwordField,
      ];
}

final class LoginInstance extends LoginState {
  LoginInstance({
    required super.passwordField,
  });
}
