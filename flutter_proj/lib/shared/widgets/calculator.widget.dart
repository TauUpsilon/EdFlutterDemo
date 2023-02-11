import 'package:custom_math/custom_math.dart';

import 'package:flutter/material.dart';

import 'package:flutter_proj/shared/widgets/dial_button.widget.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({required Key key}) : super(key: key);

  @override
  CalculatorWidgetState createState() => CalculatorWidgetState();
}

class CalculatorWidgetState extends State<CalculatorWidget> {
  late String firstNum = '';
  late String secondNum = '';
  late String operator = '';
  late String displayText = '0';

  List<List<String>> createDialArray() {
    const cols = 4;
    const rows = 5;
    final array = List.generate(
      rows,
      (row) => List.generate(
        cols,
        (col) => 0.toString(),
        growable: false,
      ),
      growable: false,
    );

    array[4][0] = "00";
    array[4][1] = "0";
    array[4][2] = ".";
    array[4][3] = "=";

    array[3][0] = "1";
    array[3][1] = "2";
    array[3][2] = "3";
    array[3][3] = "+";

    array[2][0] = "4";
    array[2][1] = "5";
    array[2][2] = "6";
    array[2][3] = "-";

    array[1][0] = "7";
    array[1][1] = "8";
    array[1][2] = "9";
    array[1][3] = "x";

    array[0][0] = "ac";
    array[0][1] = "c";
    array[0][2] = "<";
    array[0][3] = "/";

    return array;
  }

  Future<double> _calculate(double a, String operator, double b) async {
    switch (operator) {
      case '+':
        return await CustomMath.add(a, b) ?? 0;
      case '-':
        return await CustomMath.subtract(a, b) ?? 0;
      case 'x':
        return await CustomMath.multiply(a, b) ?? 0;
      case '/':
        return await CustomMath.divide(a, b) ?? 0;
    }

    throw ArgumentError(operator);
  }

  void _clearCalculator(String val) {
    switch (val) {
      case '<':
        if (secondNum.isEmpty) {
          setState(() {
            displayText = displayText.substring(0, displayText.length - 1);

            if (displayText.isEmpty) {
              displayText = '0';
            }
          });
        }

        break;

      case 'c':
        if (secondNum.isEmpty) {
          setState(() {
            displayText = '0';
          });
        }

        break;

      case 'ac':
        setState(() {
          firstNum = '';
          operator = '';
          secondNum = '';
          displayText = '0';
        });

        break;

      default:
        break;
    }
  }

  void _doSum() {
    if (firstNum.isNotEmpty &&
        secondNum.isEmpty &&
        !displayText.endsWith('.')) {
      setState(() {
        secondNum = displayText;

        final pattern =
            RegExp(r'^([0-9]\d*(\.\d+)?)([\/+x-])([0-9]\d*(\.\d+)?)$');
        final match = pattern.firstMatch('$firstNum$operator$secondNum')!;

        _calculate(
          double.tryParse(match[1].toString())!,
          match[3].toString(),
          double.tryParse(match[4].toString())!,
        ).then(
          (value) => displayText = value.toString(),
        );
      });
    }
  }

  void _handleNumericVal(String val) {
    setState(() {
      if (RegExp(r'[\.]').hasMatch(displayText)) {
        displayText += val;
      } else {
        displayText += val;
        displayText = displayText.replaceAll(RegExp(r'^0+(?=.)'), '');
      }
    });
  }

  void _handleDecimalPlace() {
    setState(() {
      displayText = RegExp(r'[\.]').hasMatch(displayText)
          ? displayText
          : displayText += '.';
    });
  }

  void _handlePressOnOperator(String val) {
    if (firstNum.isEmpty && !displayText.endsWith('.')) {
      setState(() {
        firstNum = displayText;
        operator = val;
        displayText = '0';
      });
    }
  }

  bool _isdoubleeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void onDialPress(String val) {
    if (_isdoubleeric(val) && secondNum.isEmpty) {
      _handleNumericVal(val);
    } else {
      if (RegExp(r'[\<acc]').hasMatch(val)) {
        _clearCalculator(val);
      } else if (RegExp(r'[\/+x-]').hasMatch(val)) {
        _handlePressOnOperator(val);
      } else if (RegExp(r'[\=]').hasMatch(val)) {
        _doSum();
      } else if (RegExp(r'[\.]').hasMatch(val)) {
        _handleDecimalPlace();
      }
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
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
                  '$firstNum $operator $secondNum',
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
                  displayText,
                  style: const TextStyle(
                    fontSize: 48,
                  ),
                ),
              ),
            ),

            // Keyboards
            ...createDialArray()
                .map(
                  (row) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: row
                        .map(
                          (col) => DialButtonWidget(
                            key: UniqueKey(),
                            text: col,
                            onPress: (text) => onDialPress(text),
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
