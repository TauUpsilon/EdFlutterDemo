part of 'app_digit_keyboard_view.dart';

class AppDigitKeyboardCubit extends Cubit<AppDigitKeyboardState> {
  AppDigitKeyboardCubit() : super(AppDigitKeyboardState.init());

  void onDialTapped(
    Widget widget,
    ValueChanged<String> onValueChanged,
    VoidCallback onSubmitted,
  ) {
    if (widget is Text) {
      emit(state.copyWith(digitVal: '${state.digitVal}${widget.data}'));
      onValueChanged(state.digitVal);
    } else if (widget is Icon && widget.icon == Icons.clear_rounded) {
      final val = state.digitVal;
      if (val.isEmpty) return;
      emit(state.copyWith(digitVal: val.substring(0, val.length - 1)));
      onValueChanged(state.digitVal);
    } else if (widget is Icon && widget.icon == Icons.arrow_forward_rounded) {
      emit(AppDigitKeyboardState.init());
      onSubmitted();
    }
  }
}
