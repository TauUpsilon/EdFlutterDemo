import 'package:eyr/apr/apr_model.dart';

class NetworkRoute extends AppRoute {
  NetworkRoute({super.parent});

  @override
  String get path => 'network';

  AppRoute get todoDetail => _NetworkTodoDetailRoute(parent: this);
}

class _NetworkTodoDetailRoute extends AppRoute {
  _NetworkTodoDetailRoute({super.parent});

  @override
  String get path => 'todo-detail';
}
