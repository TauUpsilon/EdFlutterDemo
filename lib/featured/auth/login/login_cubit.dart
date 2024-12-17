import 'package:eyr/apn/app/app_routes.dart';
import 'package:eyr/featured/auth/login/login_state.dart';
import 'package:eyr/shared/fields/password/password_field.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());

  final _auth = GetIt.I<AuthCubit>();
  final _router = GetIt.I<GoRouter>();

  final formKey = GlobalKey<FormState>();

  void onPasswordChange(String value) {
    emit(
      state.copyWith(
        passwordField: PasswordField.dirty(
          field: state.passwordField,
          value: value,
        ),
      ),
    );
  }

  Future<void> login(
    Uri? redirectUrl,
    Map<String, dynamic>? redirectExtra,
  ) async {
    if (!formKey.currentState!.validate()) return;

    _auth.login();

    _router.replace(
      redirectUrl?.path ?? AppRoutes.home.fullpath,
      extra: redirectExtra,
    );
  }
}
