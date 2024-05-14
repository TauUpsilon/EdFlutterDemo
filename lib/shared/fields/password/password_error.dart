part of 'password_field.dart';

enum PasswordError {
  invalid,
  empty,
}

extension PasswordErrorExtension on PasswordError {
  String toMessage(BuildContext context) => switch (this) {
        PasswordError.invalid => Localiser.of(context).fieldPasswordInvalid,
        PasswordError.empty => Localiser.of(context).fieldPasswordEmpty,
      };
}
