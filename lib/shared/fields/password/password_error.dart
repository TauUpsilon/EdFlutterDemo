part of 'password_field.dart';

enum PasswordError {
  invalid,
  empty,
}

extension PasswordErrorExtension on PasswordError {
  Localiser get _locoliser => GetIt.I<LocaleCubit>().state.localiser;

  String get text => switch (this) {
        PasswordError.invalid => _locoliser.passwordInvalid,
        PasswordError.empty => _locoliser.passwordEmpty,
      };
}
