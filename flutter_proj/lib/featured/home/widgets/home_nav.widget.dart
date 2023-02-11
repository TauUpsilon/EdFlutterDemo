import 'package:flutter/material.dart';
import 'package:flutter_proj/core/app_stateless.widget.dart';

class HomeNavWidget extends AppStatelessWidget {
  final int index;
  final Function(int index) onNavBarTapped;

  HomeNavWidget({
    super.key,
    required this.index,
    required this.onNavBarTapped,
  });

  List<BottomNavigationBarItem> makeNavBarItems() => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.network_check),
          label: 'Network',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: 'Widget',
        ),
      ];

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        iconSize: 36,
        backgroundColor: Colors.black,
        showUnselectedLabels: false,
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        items: makeNavBarItems(),
        currentIndex: index,
        onTap: (index) => onNavBarTapped(index),
      );
}
