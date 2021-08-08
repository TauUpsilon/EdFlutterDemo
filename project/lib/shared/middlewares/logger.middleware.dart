import 'package:project/store/actions/api_req.action.dart';
import 'package:redux/redux.dart';

void loggingMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is ApiRequestAction) {
    print(
        "{\n\tAction: ${action.type},\n\tPayload: ${action.payload != null}\n}");
  }

  next(action);
}
