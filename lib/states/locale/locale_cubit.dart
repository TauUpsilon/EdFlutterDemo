import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState.init());

  Future<void> update(String lanCode) async {
    emit(
      state.copyWith(
        locale: Locale(lanCode),
      ),
    );
  }
}
