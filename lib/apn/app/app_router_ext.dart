import 'package:go_router/go_router.dart';

extension AppRouterExt on GoRouter {
  Future<void> pushAndPopUntil(
    String location,
    String until, {
    Object? extra,
  }) async {
    popUntil(until);
    push(location, extra: extra);
  }

  Future<void> pushNamedAndPopUntil(
    String name,
    String until, {
    Object? extra,
  }) async {
    popUntil(name);
    pushNamed(name, extra: extra);
  }

  void popUntilRoot() {
    while (canPop()) {
      pop();
    }
  }

  void popUntil(String target) {
    final list = routerDelegate.currentConfiguration.routes.toList();

    for (final route in list.reversed) {
      if (route is GoRoute) {
        if (route.path == target || route.name == target) break;
        if (!canPop()) break;
        pop();
      }

      if (list.elementAt(list.indexOf(route) - 1) is ShellRoute) {
        routerDelegate.currentConfiguration.matches.removeLast();
      }
    }
  }
}
