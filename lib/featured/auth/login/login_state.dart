part of 'login_view.dart';

@immutable
sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();

  factory LoginInitial.init() => const LoginInitial();
  factory LoginInitial.copyWith() => const LoginInitial();
}
