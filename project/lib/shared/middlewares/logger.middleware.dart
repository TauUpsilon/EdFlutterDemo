import 'package:project/store/actions/data_request.action.dart';
import 'package:redux/redux.dart';

void loggingMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is DataRequestAction) {
    print(
        "{\n\tAction: ${action.type},\n\tPayload: ${action.payload != null}\n}");
  }

  next(action);
}
