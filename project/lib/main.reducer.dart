import 'package:project/main.action.dart';
import 'package:project/main.model.dart';
import 'package:project/main.state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    apiResponse: apiReqReducer(state.apiResponse, action),
  );
}

ApiResponse apiReqReducer(ApiResponse state, ApiRequestAction action) {
  ApiResponse newState = state;

  switch (action.type) {
    case ActionType.LOADING:
      newState.status = ResponseStatus.LOADING;
      newState.body.meta = null;
      newState.body.data = null;

      return newState;

    case ActionType.SUCCESS:
      newState.status = ResponseStatus.SUCCESS;
      newState.body.meta = Meta.fromJson(action.payload['meta']);
      newState.body.data = action.payload['data'];

      return newState;

    case ActionType.FAILURE:
      newState.status = ResponseStatus.FAILURE;
      newState.body.meta = null;
      newState.body.data = null;

      return newState;

    default:
      return newState;
  }
}
