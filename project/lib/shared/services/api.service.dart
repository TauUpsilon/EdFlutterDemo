import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/main.locator.dart';
import 'package:project/shared/decorators/imitable.decorator.dart';
import 'package:project/shared/models/api_response.model.dart';
import 'package:project/shared/requests/base.request.dart';
import 'package:project/shared/services/store.service.dart';
import 'package:project/store/actions/api_req.action.dart';
import 'package:reflectable/reflectable.dart';
import 'package:rxdart/rxdart.dart';

class ApiService {
  final _baseUri = 'https://gorest.co.in/public/v1';
  final _storeService = locator.get<StoreService>();

  void request<T>(
      BaseRequest request, BehaviorSubject<ApiResponse<T>> subject) {
    var store = this._storeService.store;
    var uri = Uri.parse('${this._baseUri}/${request.name}');

    store.dispatch(ApiRequestAction(type: ActionType.LOADING));
    var status = store.state.apiResponse.status;
    var res = ApiResponse<T>(status: status);
    subject.add(res);

    http.get(uri).then((res) {
      var mirror = imitable.reflectType(T) as ClassMirror;

      final action = ApiRequestAction(
          type: ActionType.SUCCESS,
          payload: jsonDecode(res.body),
          mirror: mirror);

      store.dispatch(action);

      var data = store.state.apiResponse.body.data
          .map<T>((item) => mirror.invoke('fromJson', [item.toJson()]))
          .toList();

      var meta = store.state.apiResponse.body.meta;
      var status = store.state.apiResponse.status;
      var body = ResponseBody<T>(meta: meta, data: data);

      subject.add(ApiResponse<T>(status: status, body: body));
    });
  }
}
