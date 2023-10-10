import 'package:flutter/widgets.dart';

part 'mask_action.redux.dart';
part 'mask_state.redux.dart';

MaskState maskReducer(MaskState state, MaskAction action) {
  if (action is AddMaskClientAction) {
    if (!state.clients.contains(action.clientName)) {
      state.clients.add(action.clientName);
    }

    return state;
  } else if (action is PopMaskClientAction) {
    if (state.clients.contains(action.clientName)) {
      state.clients.remove(action.clientName);
    }

    return state;
  } else {
    return state;
  }
}
