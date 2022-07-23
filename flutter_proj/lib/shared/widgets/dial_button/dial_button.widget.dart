import 'package:flutter/material.dart';

import 'package:flutter_proj/shared/widgets/dial_button/dial_button.view.dart';

class DialButtonWidget extends StatelessWidget {
  final String text;
  final Function(String) onPress;

  const DialButtonWidget({
    required Key key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DialButtonWidgetView(
        key: UniqueKey(),
        state: this,
      );
}
