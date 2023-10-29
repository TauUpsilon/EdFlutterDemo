import 'package:flutter/widgets.dart';
import 'package:flutter_proj/states/redux/global_store/global.reducer.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

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
