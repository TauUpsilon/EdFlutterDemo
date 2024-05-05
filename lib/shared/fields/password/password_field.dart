import 'package:eyr/localised/localiser.g.dart';
import 'package:eyr/states/locale/locale_cubit.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';

part 'password_error.dart';

class PasswordField extends FormzInput<String, PasswordError> {
  const PasswordField.pure([super.value = '']) : super.pure();
  const PasswordField.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    } else if (!_passwordRegex.hasMatch(value)) {
      return PasswordError.invalid;
    }

    return null;
  }
}
