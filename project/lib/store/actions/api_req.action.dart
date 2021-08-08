import 'package:reflectable/reflectable.dart';

enum ActionType { LOADING, SUCCESS, FAILURE }

class ApiRequestAction {
  ActionType type;
  ClassMirror mirror;
  Map<String, dynamic> payload;

  ApiRequestAction({this.type, this.mirror, this.payload});
}
