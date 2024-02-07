part of 'app_digit_keyboard_view.dart';

@immutable
sealed class AppDigitKeyboardState with EquatableMixin {
  final String digitVal;

  const AppDigitKeyboardState({
    required this.digitVal,
  });

  factory AppDigitKeyboardState.init() => const AppDigitKeyboardInstance(
        digitVal: '',
      );

  AppDigitKeyboardState copyWith({
    required String digitVal,
  }) =>
      AppDigitKeyboardInstance(
        digitVal: digitVal,
      );
}

final class AppDigitKeyboardInstance extends AppDigitKeyboardState {
  const AppDigitKeyboardInstance({
    required super.digitVal,
  });

  @override
  List<Object?> get props => [
        super.digitVal,
      ];
}
