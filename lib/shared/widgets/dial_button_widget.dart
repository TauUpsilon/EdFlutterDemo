import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DialButtonWidget extends StatelessWidget {
  final String text;
  final Function(String) onPress;

  const DialButtonWidget({
    required this.text,
    required this.onPress,
    super.key,
  });

  ElevatedButton button() => ElevatedButton(
        onPressed: () => onPress(text),
        style: buttonStyle(),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(ObjectFlagProperty<Function(String p1)>.has('onPress', onPress));
  }
}
