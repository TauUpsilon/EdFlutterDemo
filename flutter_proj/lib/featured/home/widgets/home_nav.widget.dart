import 'package:flutter/material.dart';

class HomeNavWidget extends StatelessWidget {
  final int index;
  final Function(int index) onNavBarTapped;

  const HomeNavWidget({
    required Key key,
    required this.index,
    required this.onNavBarTapped,
  }) : super(key: key);

  List<BottomNavigationBarItem> get makeNavBarItems => const [
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
        items: makeNavBarItems,
        currentIndex: index,
        onTap: (index) => onNavBarTapped(index),
      );
}
