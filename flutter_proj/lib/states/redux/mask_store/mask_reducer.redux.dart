part 'mask_action.redux.dart';
part 'mask_state.redux.dart';

MaskReduxState maskReducer(MaskReduxState state, MaskReduxAction action) {
  if (action is AddMaskClientAction) {
    if (!state.clients.contains(action.clientName)) {
      state.clients.add(action.clientName);
    }

    return state;
  } else if (action is RemoveMaskClientAction) {
    if (state.clients.contains(action.clientName)) {
      state.clients.remove(action.clientName);
    }

    return state;
  } else {
    return state;
  }
}
