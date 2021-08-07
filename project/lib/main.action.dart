enum ActionType { LOADING, SUCCESS, FAILURE }

class ApiRequestAction {
  ActionType type;
  Map<String, dynamic> payload;

  ApiRequestAction({this.type, this.payload});
}
