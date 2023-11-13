part of 'router.reducer.dart';

sealed class RouterAction {}

class UpdateRouterStateAction extends RouterAction {
  Route currentRoute;
  Route? previousRoute;

  UpdateRouterStateAction({
    required this.currentRoute,
    this.previousRoute,
  });
}
