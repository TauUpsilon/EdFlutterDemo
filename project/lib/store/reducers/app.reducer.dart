import 'package:project/store/reducers/data_room.reducer.dart';
import 'package:project/store/states/app.state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    dataRoom: dataRoomReducer(state.dataRoom, action),
  );
}
