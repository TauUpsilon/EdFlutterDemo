import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.init());

  void login() {
    emit(AuthState.copyWith(isAuthenticated: true));
  }

  void logout() {
    emit(AuthState.copyWith(isAuthenticated: false));
  }
}
