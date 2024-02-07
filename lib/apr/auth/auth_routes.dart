import 'package:eyr/apr/apr_model.dart';

class AuthRoute extends AppRoute {
  AuthRoute({super.parent});

  @override
  String get path => 'auth';

  AppRoute get login => _LoginRoute(parent: this);
}

class _LoginRoute extends AppRoute {
  _LoginRoute({super.parent});

  @override
  String get path => 'login';
}
