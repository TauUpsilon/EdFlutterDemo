import 'package:flutter/widgets.dart';

part 'router.action.dart';
part 'router.state.dart';

RouterState routerReducer(RouterState state, RouterAction action) {
  if (action is UpdateRouterStateAction) {
    return RouterState(
      currentRoute: action.currentRoute.settings.name,
      previousRoute: action.previousRoute?.settings.name,
      params: action.currentRoute.settings.arguments,
    );
  } else {
    return state;
  }
}
