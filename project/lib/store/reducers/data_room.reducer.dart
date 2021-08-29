import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/models/meta.model.dart';
import 'package:project/store/actions/data_request.action.dart';

DataRoom dataRoomReducer(DataRoom state, DataRequestAction action) {
  DataRoom newState = state;

  switch (action.type) {
    case ActionType.LOADING:
      newState.status = ResponseStatus.LOADING;

      return newState;

    case ActionType.SUCCESS:
      newState.status = ResponseStatus.SUCCESS;
      newState.collections[action.request.name] = Collection(
          meta: Meta.fromJson(action.payload['meta']),
          data: action.payload['data']
              .map((item) => action.mirror.invoke("fromJson", [item]))
              .toList());

      return newState;

    case ActionType.FAILURE:
      newState.status = ResponseStatus.FAILURE;
      newState.collections[action.request.name] = null;

      return newState;

    default:
      return newState;
  }
}
