import 'package:flutter/material.dart';

import 'package:flutter_proj/featured/home/widgets/home_nav/home_nav.widget.dart';
import 'package:flutter_proj/shared/core/base_view.core.dart';

class HomeNavWidgetView extends BaseView<HomeNavWidget> {
  const HomeNavWidgetView({
    required Key key,
    required HomeNavWidget state,
  }) : super(state: state, key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 36,
      backgroundColor: Colors.red[400],
      showUnselectedLabels: false,
      selectedFontSize: 16,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black26,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: 'Widget',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.network_check),
          label: 'Network',
        )
      ],
      currentIndex: state.index,
      onTap: (index) => state.onNavBarTapped(index),
    );
  }
}
