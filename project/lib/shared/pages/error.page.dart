import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Error',
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(2),
          child: Container(
            child: Center(
              child: Text('ERROR'),
            ),
          )),
    );
  }
}
