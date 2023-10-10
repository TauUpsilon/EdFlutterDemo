part of 'router_reducer.redux.dart';

@immutable
class RouterState {
  final String? currentRoute;
  final String? previousRoute;
  final Object? params;

  const RouterState({
    this.currentRoute,
    this.previousRoute,
    this.params,
  });

  RouterState.initialState()
      : currentRoute = '',
        previousRoute = '',
        params = {};

  factory RouterState.copy(RouterState state) {
    return RouterState(
      currentRoute: state.currentRoute,
      previousRoute: state.previousRoute,
      params: state.params,
    );
  }
}
