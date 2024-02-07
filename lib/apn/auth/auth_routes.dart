import 'package:eyr/apn/apn_model.dart';

class AuthRoute extends ApnRoute {
  AuthRoute({super.parent});

  @override
  String get path => 'auth';

  ApnRoute get login => _LoginRoute(parent: this);
}

class _LoginRoute extends ApnRoute {
  _LoginRoute({super.parent});

  @override
  String get path => 'login';
}
