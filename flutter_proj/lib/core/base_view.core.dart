import 'package:flutter/cupertino.dart';

abstract class BaseView<S> extends StatelessWidget {
  final S state;

  const BaseView({
    required Key key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context);
}
