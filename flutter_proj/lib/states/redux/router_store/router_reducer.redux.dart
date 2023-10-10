import 'package:flutter/widgets.dart';

part 'router_action.redux.dart';
part 'router_state.redux.dart';

RouterReduxState routerReducer(RouterReduxState state, RouterReduxAction action) {
  var newState = RouterReduxState.copy(state);

  if (action is UpdateRouterStateAction) {
    newState.currentRoute = action.currentRoute.settings.name;
    newState.params = action.currentRoute.settings.arguments;
    newState.previousRoute = action.previousRoute?.settings.name;

    return newState;
  } else {
    return newState;
  }
}
