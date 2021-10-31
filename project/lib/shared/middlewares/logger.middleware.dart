import 'package:project/store/data_room/data_room.action.dart';
import 'package:redux/redux.dart';

void loggingMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is DataRoomAction) {
    print(
      "{\n\tAction: ${action.type},\n\tPayload: ${action.payload != null}\n}",
    );
  }

  next(action);
}
