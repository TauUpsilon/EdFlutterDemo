part of 'digit_keyboard_cubit.dart';

class DigitKeyboard extends StatelessWidget {
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<Color?>? foregroundColor;

  final double foregroundSize;

  final ValueChanged<String> onValueChanged;
  final ValueChanged<String> onSubmitted;

  const DigitKeyboard({
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
      create: (context) => DigitKeyboardCubit(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: _keysGrid,
      ),
    );
  }

  List<Widget> get _keys => [
        Icon(
          Icons.clear_rounded,
          size: foregroundSize - 5,
        ),
        Text(
          '0',
          style: TextStyle(fontSize: foregroundSize),
        ),
        Icon(
          Icons.arrow_forward_rounded,
          size: foregroundSize - 5,
        ),
        ...List.generate(
          9,
          (index) => Text(
            '${index + 1}',
            style: TextStyle(fontSize: foregroundSize),
          ),
        ),
      ];

  Widget get _keysGrid {
    const dialSpacing = 10.0;
    const dialShadowOffset = 2.0;
    const dialBlurRadius = 10.0;
    const dialBorderRadius = 10.0;

    return BlocBuilder<DigitKeyboardCubit, DigitKeyboardState>(
      builder: (context, state) => GridView.count(
        padding: const EdgeInsets.all(25),
        mainAxisSpacing: dialSpacing,
        crossAxisSpacing: dialSpacing,
        reverse: true,
        shrinkWrap: true,
        crossAxisCount: 3,
        children: _keys
            .map(
              (widget) => GestureDetector(
                onTap: () => context.read<DigitKeyboardCubit>().onDialTapped(
                      widget,
                      onValueChanged,
                      onSubmitted,
                    ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(dialBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset:
                            const Offset(dialShadowOffset, dialShadowOffset),
                        blurRadius: dialBlurRadius,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-dialShadowOffset, -dialShadowOffset),
                        blurRadius: dialBlurRadius,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(child: widget),
                  // ElevatedButton(
                  //   onPressed: () =>
                  //       context.read<DigitKeyboardCubit>().onDialTapped(
                  //             widget,
                  //             onValueChanged,
                  //             onSubmitted,
                  //           ),
                  //   style: ButtonStyle(
                  //     backgroundColor: backgroundColor,
                  //     foregroundColor: foregroundColor,
                  //     shape: MaterialStatePropertyAll(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(dialBorderRadius),
                  //       ),
                  //     ),
                  //     textStyle: MaterialStatePropertyAll(
                  //       TextStyle(fontSize: foregroundSize),
                  //     ),
                  //     iconSize: MaterialStatePropertyAll(foregroundSize - 5),
                  //   ),
                  //   child: widget,
                  // ),
                ),
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
      ..add(
        DiagnosticsProperty<MaterialStateProperty<Color?>?>(
          'backgroundColor',
          backgroundColor,
        ),
      )
      ..add(
        DiagnosticsProperty<MaterialStateProperty<Color?>?>(
          'foregroundColor',
          foregroundColor,
        ),
      )
      ..add(DoubleProperty('foregroundSize', foregroundSize))
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has(
          'onValueChanged',
          onValueChanged,
        ),
      )
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has(
          'onSubmitted',
          onSubmitted,
        ),
      );
  }
}
