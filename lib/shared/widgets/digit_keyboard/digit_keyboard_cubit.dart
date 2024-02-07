// ignore_for_file: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'digit_keyboard_state.dart';
part 'digit_keyboard_view.dart';

class DigitKeyboardCubit extends Cubit<DigitKeyboardState> {
  DigitKeyboardCubit() : super(const DigitKeyboardState(''));

  void onDialTapped(
    Widget widget,
    ValueChanged<String> onValueChanged,
    ValueChanged<String> onSubmitted,
  ) {
    if (widget is Text) {
      emit(state.copyWith('${state.digitVal}${widget.data}'));
      onValueChanged(state.digitVal);
    } else if (widget is Icon && widget.icon == Icons.clear_rounded) {
      emit(state.copyWith(''));
      onValueChanged(state.digitVal);
    } else if (widget is Icon && widget.icon == Icons.arrow_forward_rounded) {
      onSubmitted(state.digitVal);
    }
  }
}
