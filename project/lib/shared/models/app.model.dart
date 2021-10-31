import 'package:project/shared/models/data_room.model.dart';

class AppModel {
  final DataRoom DATA_ROOM;

  AppModel({this.DATA_ROOM});

  static initial() {
    return AppModel(
      DATA_ROOM: DataRoom.initial(),
    );
  }
}
