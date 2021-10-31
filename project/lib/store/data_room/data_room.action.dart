import 'package:project/shared/requests/base.request.dart';
import 'package:reflectable/reflectable.dart';

enum ActionType { LOADING, SUCCESS, FAILURE }

class DataRoomAction {
  ActionType type;
  Map<String, dynamic> payload;
  BaseRequest request;
  ClassMirror mirror;

  DataRoomAction({
    this.type,
    this.payload,
    this.request,
    this.mirror,
  });
}
