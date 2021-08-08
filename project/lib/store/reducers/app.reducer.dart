import 'package:project/store/reducers/api_req.reducer.dart';
import 'package:project/store/states/app.state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    apiResponse: apiReqReducer(state.apiResponse, action),
  );
}
