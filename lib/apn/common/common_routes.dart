import 'package:eyr/apn/apn_model.dart';

class CommonRoute extends ApnRoute {
  CommonRoute({super.parent});

  @override
  String get path => 'common';

  ApnRoute get test => _TestRoute(parent: this);
}

class _TestRoute extends ApnRoute {
  _TestRoute({super.parent});

  @override
  String get path => 'test';
}
