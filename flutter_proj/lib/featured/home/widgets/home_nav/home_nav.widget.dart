import 'package:flutter/material.dart';

import 'package:flutter_proj/featured/home/widgets/home_nav/home_nav.view.dart';

class HomeNavWidget extends StatelessWidget {
  final int index;
  final Function(int index) onNavBarTapped;

  const HomeNavWidget({
    required Key key,
    required this.index,
    required this.onNavBarTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HomeNavWidgetView(
        key: UniqueKey(),
        state: this,
      );
}
