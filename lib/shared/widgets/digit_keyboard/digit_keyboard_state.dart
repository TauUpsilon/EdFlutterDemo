part of 'digit_keyboard_cubit.dart';

class DigitKeyboardState extends Equatable {
  final String digitVal;

  const DigitKeyboardState(this.digitVal);

  DigitKeyboardState copyWith(String value) => DigitKeyboardState(value);

  @override
  List<Object> get props => [digitVal];
}
