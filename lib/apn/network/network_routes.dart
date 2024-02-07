import 'package:eyr/apn/apn_model.dart';

class NetworkRoute extends ApnRoute {
  NetworkRoute({super.parent});

  @override
  String get path => 'network';

  ApnRoute get todoDetail => _NetworkTodoDetailRoute(parent: this);
}

class _NetworkTodoDetailRoute extends ApnRoute {
  _NetworkTodoDetailRoute({super.parent});

  @override
  String get path => 'todo-detail';
}
