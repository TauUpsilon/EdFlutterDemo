part of 'router_reducer.redux.dart';

sealed class RouterReduxAction {
  static UpdateRouterStateAction updateRouterStateAction(Route currentRoute, Route? previousRoute) =>
      UpdateRouterStateAction(currentRoute: currentRoute, previousRoute: previousRoute);
}

class UpdateRouterStateAction extends RouterReduxAction {
  Route currentRoute;
  Route? previousRoute;

  UpdateRouterStateAction({
    required this.currentRoute,
    this.previousRoute,
  });
}
