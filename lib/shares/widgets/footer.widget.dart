import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha.mixin.dart';

class FooterBarWidget extends StatelessWidget with Alpha {
  // Dependency Variable
  final int selectedItem;
  final Function(int index) onNavBarTapped;

  // Local Variables
  final _barItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.network_check),
      label: 'Network',
      tooltip: '/network',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      tooltip: '/',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.widgets),
      label: 'Component',
      tooltip: '/component',
    ),
  ];

  FooterBarWidget({
    super.key,
    required this.selectedItem,
    required this.onNavBarTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 36,
      backgroundColor: Colors.black,
      showUnselectedLabels: false,
      selectedFontSize: 16,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blueGrey,
      items: _barItems,
      currentIndex: selectedItem,
      onTap: (index) => onNavBarTapped,
    );
  }
}
