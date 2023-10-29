import 'package:flutter/widgets.dart';
import 'package:flutter_proj/states/redux/global_store/global.reducer.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

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
