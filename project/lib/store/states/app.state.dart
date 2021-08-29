import 'package:project/shared/models/data_room.model.dart';

class AppState {
  final DataRoom dataRoom;

  AppState({this.dataRoom});

  factory AppState.initial() => AppState(
        dataRoom: DataRoom.initial(),
      );
}
