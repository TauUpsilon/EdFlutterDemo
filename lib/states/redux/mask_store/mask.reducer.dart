import 'package:flutter/widgets.dart';

part 'mask.action.dart';
part 'mask.state.dart';

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
