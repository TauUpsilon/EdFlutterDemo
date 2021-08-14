import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
