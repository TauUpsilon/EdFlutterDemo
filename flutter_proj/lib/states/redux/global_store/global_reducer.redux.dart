import 'package:flutter/widgets.dart';
import 'package:flutter_proj/states/redux/mask_store/mask_reducer.redux.dart';
import 'package:flutter_proj/states/redux/router_store/router_reducer.redux.dart';

part 'global_state.redux.dart';

GlobalState globalReducer(GlobalState state, dynamic action) {
  if (action is MaskAction) {
    return GlobalState(
      mask: maskReducer(state.mask, action),
      router: state.router,
    );
  } else if (action is RouterAction) {
    return GlobalState(
      mask: state.mask,
      router: routerReducer(state.router, action),
    );
  } else {
    return state;
  }
}
