import 'package:project/shared/models/api_response.model.dart';
import 'package:project/shared/models/meta.model.dart';
import 'package:project/store/actions/api_req.action.dart';

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
      newState.body.data = action.payload['data']
          .map((item) => action.mirror.invoke("fromJson", [item]))
          .toList();

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
