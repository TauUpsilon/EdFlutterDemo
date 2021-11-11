import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/models/meta.model.dart';
import 'package:project/store/data_room/data_room.action.dart';

DataRoom dataRoomReducer(DataRoom state, DataRoomAction action) {
  DataRoom newState = state;

  switch (action.type) {
    case ActionType.LOADING:
      newState.STATUS = ResponseStatus.LOADING;

      return newState;

    case ActionType.SUCCESS:
      newState.STATUS = ResponseStatus.SUCCESS;

      newState.COLLECTIONS![action.request!.NAME!] = Collection(
        META: action.payload!['meta'] == null
            ? null
            : Meta.fromJson(action.payload!['meta']),
        DATA: action.payload!['data']
            .map((item) => action.mirror!.invoke("fromJson", [item]))
            .toList(),
      );

      return newState;

    case ActionType.FAILURE:
      newState.STATUS = ResponseStatus.FAILURE;
      newState.COLLECTIONS![action.request!.NAME!] = new Collection();

      return newState;

    default:
      return newState;
  }
}
