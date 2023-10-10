part of 'router_reducer.redux.dart';

class RouterReduxState {
  String? currentRoute;
  String? previousRoute;
  Object? params;

  RouterReduxState({
    this.currentRoute,
    this.previousRoute,
    this.params,
  });

  RouterReduxState.initialState();

  factory RouterReduxState.copy(RouterReduxState state) {
    return RouterReduxState(
      currentRoute: state.currentRoute,
      previousRoute: state.previousRoute,
      params: state.params,
    );
  }
}
