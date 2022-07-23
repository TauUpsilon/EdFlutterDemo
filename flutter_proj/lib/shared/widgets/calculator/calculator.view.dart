import 'package:flutter/material.dart';

import 'package:flutter_proj/shared/core/base_view.core.dart';
import 'package:flutter_proj/shared/widgets/calculator/calculator.widget.dart';
import 'package:flutter_proj/shared/widgets/dial_button/dial_button.widget.dart';

class CalculatorWidgetView extends BaseView<CalculatorWidgetState> {
  const CalculatorWidgetView({
    required Key key,
    required CalculatorWidgetState state,
  }) : super(state: state, key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Arithmetic
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                '${state.firstNum} ${state.operator} ${state.secondNum}',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),

          // Number Display
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                state.displayText,
                style: const TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
          ),

          // Keyboards
          ...state
              .createDialArray()
              .map(
                (row) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: row
                      .map(
                        (col) => DialButtonWidget(
                          key: UniqueKey(),
                          text: col,
                          onPress: (text) => state.onDialPress(text),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
