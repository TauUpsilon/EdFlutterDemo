import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_digit_keyboard_cubit.dart';
part 'app_digit_keyboard_state.dart';

class AppDigitKeyboard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;

  final double foregroundSize;

  final ValueChanged<String> onValueChanged;
  final VoidCallback onSubmitted;

  const AppDigitKeyboard({
    required this.onValueChanged,
    required this.onSubmitted,
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.foregroundSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppDigitKeyboardCubit(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: _keysGrid,
      ),
    );
  }

  List<Widget> get _keys => [
        const Icon(Icons.clear_rounded),
        const Text('0'),
        const Icon(Icons.arrow_forward_rounded),
        ...List.generate(
          9,
          (index) => Text('${index + 1}'),
        ),
      ];

  Widget get _keysGrid {
    const dialSpacing = 2.0;
    const dialBorderRadius = 5.0;

    return BlocBuilder<AppDigitKeyboardCubit, AppDigitKeyboardState>(
      builder: (context, state) => GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: dialSpacing,
        crossAxisSpacing: dialSpacing,
        reverse: true,
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 2 - foregroundSize * 0.01,
        children: _keys
            .map(
              (widget) => ElevatedButton(
                onPressed: () =>
                    context.read<AppDigitKeyboardCubit>().onDialTapped(
                          widget,
                          onValueChanged,
                          onSubmitted,
                        ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    backgroundColor,
                  ),
                  foregroundColor: MaterialStatePropertyAll(
                    foregroundColor,
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(dialBorderRadius),
                    ),
                  ),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: foregroundSize),
                  ),
                  iconSize: MaterialStatePropertyAll(
                    foregroundSize - 5,
                  ),
                ),
                child: widget,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('foregroundSize', foregroundSize))
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has(
          'onValueChanged',
          onValueChanged,
        ),
      )
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(ObjectFlagProperty<VoidCallback>.has('onSubmitted', onSubmitted));
  }
}
