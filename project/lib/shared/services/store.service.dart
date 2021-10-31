import 'package:project/shared/middlewares/logger.middleware.dart';
import 'package:project/store/app/app.reducer.dart';
import 'package:project/shared/models/app.model.dart';
import 'package:redux/redux.dart';

class StoreService {
  final _store = Store<AppModel>(
    appReducer,
    initialState: AppModel.initial(),
    middleware: [loggingMiddleware],
  );

  Store<AppModel> get store {
    return _store;
  }
}
