import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends BaseWidgetState<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/user');
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'User List',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      )),
    );
  }
}
