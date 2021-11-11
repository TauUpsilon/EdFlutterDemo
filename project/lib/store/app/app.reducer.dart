import 'package:project/store/data_room/data_room.reducer.dart';
import 'package:project/shared/models/app.model.dart';

AppModel appReducer(AppModel state, action) {
  return AppModel(
    DATA_ROOM: dataRoomReducer(
      state.DATA_ROOM!,
      action,
    ),
  );
}
