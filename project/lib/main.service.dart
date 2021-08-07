import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/main.action.dart';
import 'package:project/main.locator.dart';
import 'package:project/main.middleware.dart';
import 'package:project/main.model.dart';
import 'package:project/main.reducer.dart';
import 'package:project/main.request.dart';
import 'package:project/main.state.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/subjects.dart';

class MainService {
  final _apiService = locator.get<ApiService>();
  final _storeService = locator.get<StoreService>();

  BehaviorSubject<Store<AppState>> subject = BehaviorSubject<Store<AppState>>();

  void requestData() {
    var store = this._storeService.store;
    var userRequest = UserRequest();

    this._apiService.loading();
    this.subject.add(store);
    this._apiService.request(userRequest).then((_) {
      this.subject.add(store);
    });
  }

  Stream<Store<AppState<User>>> fetchDataStore() {
    requestData();
    return subject.map((res) {
      var jsonList = res.state.apiResponse.body.data;
      var data = jsonList.map((d) => User.fromJson(d)).toList();
      res.state.apiResponse.body.data = data;

      return res;
    });
  }
}

class ApiService {
  final _baseUri = 'https://gorest.co.in/public/v1';
  final _storeService = locator.get<StoreService>();

  void loading() {
    var store = this._storeService.store;

    store.dispatch(ApiRequestAction(type: ActionType.LOADING));
  }

  Future<void> request(BaseRequest request) async {
    var store = this._storeService.store;

    await http.get(Uri.parse('${this._baseUri}/${request.name}')).then((res) {
      final action = ApiRequestAction(
          type: ActionType.SUCCESS, payload: jsonDecode(res.body));

      store.dispatch(action);
    });
  }
}

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
