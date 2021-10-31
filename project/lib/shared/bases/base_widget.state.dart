import 'package:flutter/material.dart';

class BaseWidgetState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();

    print(this);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    throw UnimplementedError();
  }
}
