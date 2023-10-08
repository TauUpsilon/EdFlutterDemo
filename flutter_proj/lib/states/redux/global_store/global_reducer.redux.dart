import 'package:flutter_proj/states/redux/mask_store/mask_reducer.redux.dart';

part 'global_state.redux.dart';

GlobalState globalReducer(GlobalState state, dynamic action) {
  return GlobalState(
    mask: maskReducer(state.mask, action),
  );
}
