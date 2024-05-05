import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eyr/localised/localiser.g.dart';
import 'package:eyr/localised/localiser_en.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState.init());

  Future<void> update(String lanCode) async {
    final locale = Locale(lanCode);
    final localiser = await Localiser.delegate.load(locale);
    emit(
      state.copyWith(
        locale: locale,
        localiser: localiser,
      ),
    );
  }
}
