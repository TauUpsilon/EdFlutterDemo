import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class PlaygroundWidget extends StatefulWidget {
  @override
  _PlaygroundWidgetState createState() => _PlaygroundWidgetState();
}

class _PlaygroundWidgetState extends BaseWidgetState<PlaygroundWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Playground',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(child: Container()),
    );
  }
}
