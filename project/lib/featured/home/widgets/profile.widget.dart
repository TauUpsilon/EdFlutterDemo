import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends BaseWidgetState<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
