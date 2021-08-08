import 'package:project/shared/middlewares/logger.middleware.dart';
import 'package:project/store/reducers/app.reducer.dart';
import 'package:project/store/states/app.state.dart';
import 'package:redux/redux.dart';

class StoreService {
  final _store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [loggingMiddleware],
  );

  Store<AppState> get store {
    return _store;
  }
}
