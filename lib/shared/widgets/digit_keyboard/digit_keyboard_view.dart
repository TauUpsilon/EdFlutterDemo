part of 'digit_keyboard_cubit.dart';

class DigitKeyboard extends StatelessWidget {
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<Color?>? foregroundColor;

  final double foregroundSize;

  final ValueChanged<String> onValueChanged;
  final ValueChanged<String> onSubmitted;

  DigitKeyboard({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.foregroundSize = 40,
    required this.onValueChanged,
    required this.onSubmitted,
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
    final dialSpacing = 10.0;
    final dialShadowOffset = 2.0;
    final dialBlurRadius = 10.0;
    final dialBorderRadius = 10.0;

    return BlocBuilder<DigitKeyboardCubit, DigitKeyboardState>(
      builder: (context, state) => GridView.count(
        padding: EdgeInsets.all(25),
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
                        offset: Offset(dialShadowOffset, dialShadowOffset),
                        blurRadius: dialBlurRadius,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
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
}
