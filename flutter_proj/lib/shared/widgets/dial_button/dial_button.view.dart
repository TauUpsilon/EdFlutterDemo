import 'package:flutter/material.dart';

import 'package:flutter_proj/shared/core/base_view.core.dart';
import 'package:flutter_proj/shared/widgets/dial_button/dial_button.widget.dart';

class DialButtonWidgetView extends BaseView<DialButtonWidget> {
  const DialButtonWidgetView({
    required Key key,
    required DialButtonWidget state,
  }) : super(state: state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - (1.5 * 4) - 20,
      height: MediaQuery.of(context).size.width / 4 - (1.5 * 4) - 20,
      margin: const EdgeInsets.all(3),
      child: ElevatedButton(
        onPressed: () => state.onPress(state.text),
        child: Text(
          state.text,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.black!,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }
}
