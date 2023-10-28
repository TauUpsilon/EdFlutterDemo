part of 'router.reducer.dart';

mixin RouterAction {
  static UpdateRouterStateAction updateRouterStateAction(
    Route currentRoute,
    Route? previousRoute,
  ) =>
      UpdateRouterStateAction(
        currentRoute: currentRoute,
        previousRoute: previousRoute,
      );
}

class UpdateRouterStateAction with RouterAction {
  Route currentRoute;
  Route? previousRoute;

  UpdateRouterStateAction({
    required this.currentRoute,
    this.previousRoute,
  });
}
