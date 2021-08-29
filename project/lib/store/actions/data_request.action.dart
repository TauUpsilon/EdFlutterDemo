import 'package:project/shared/requests/base.request.dart';
import 'package:reflectable/reflectable.dart';

enum ActionType { LOADING, SUCCESS, FAILURE }

class DataRequestAction {
  ActionType type;
  Map<String, dynamic> payload;
  BaseRequest request;
  ClassMirror mirror;

  DataRequestAction({this.type, this.payload, this.request, this.mirror});
}
