part of 'router.reducer.dart';

sealed class RouterAction {
  static UpdateRouterStateAction updateRouterStateAction(
    Route currentRoute,
    Route? previousRoute,
  ) =>
      UpdateRouterStateAction(
        currentRoute: currentRoute,
        previousRoute: previousRoute,
      );
}

class UpdateRouterStateAction extends RouterAction {
  Route currentRoute;
  Route? previousRoute;

  UpdateRouterStateAction({
    required this.currentRoute,
    this.previousRoute,
  });
}
