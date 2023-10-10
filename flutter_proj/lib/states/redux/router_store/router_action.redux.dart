part of 'router_reducer.redux.dart';

sealed class RouterAction {
  static UpdateRouterStateAction updateRouterStateAction(Route currentRoute, Route? previousRoute) =>
      UpdateRouterStateAction(currentRoute: currentRoute, previousRoute: previousRoute);
}

class UpdateRouterStateAction extends RouterAction {
  Route currentRoute;
  Route? previousRoute;

  UpdateRouterStateAction({
    required this.currentRoute,
    this.previousRoute,
  });
}
