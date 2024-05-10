import 'package:eyr/localised/localiser.g.dart';
import 'package:eyr/states/locale/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';

part 'password_error.dart';

class PasswordField extends FormzInput<String, PasswordError> {
  final GlobalKey<FormFieldState> key;
  final TextEditingController controller;
  final FocusNode focusNode;

  const PasswordField.pure({
    required this.key,
    required this.controller,
    required this.focusNode,
  }) : super.pure('');

  factory PasswordField.init() => PasswordField.pure(
        key: GlobalKey<FormFieldState>(),
        controller: TextEditingController(),
        focusNode: FocusNode(),
      );

  PasswordField.dirty({
    required PasswordField field,
    String value = '',
  })  : key = field.key,
        controller = field.controller,
        focusNode = field.focusNode,
        super.dirty(value);

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
