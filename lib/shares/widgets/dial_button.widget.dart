import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:flutter/material.dart';

class DialButtonWidget extends StatelessWidget with CommonFunctionable {
  final String text;
  final Function(String) onPress;

  DialButtonWidget({
    super.key,
    required this.text,
    required this.onPress,
  });

  ElevatedButton button() => ElevatedButton(
        onPressed: () => onPress(text),
        style: buttonStyle(),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );

  ButtonStyle buttonStyle() => ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width / 4 - (1.5 * 4) - 8,
        height: MediaQuery.of(context).size.width / 4 - (1.5 * 4) - 8,
        margin: const EdgeInsets.all(4),
        child: button(),
      );
}
