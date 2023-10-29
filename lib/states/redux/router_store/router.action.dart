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

mixin RouterActions {
  final _globalStore = GetIt.instance.get<Store<GlobalState>>();

  void updateRouterState(Route currentRoute, Route? previousRoute) {
    _globalStore.dispatch(
      UpdateRouterStateAction(
        currentRoute: currentRoute,
        previousRoute: previousRoute,
      ),
    );
  }
}
