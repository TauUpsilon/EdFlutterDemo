import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/main.locator.dart';
import 'package:project/shared/decorators/imitable.decorator.dart';
import 'package:project/shared/models/api_data.model.dart';
import 'package:project/shared/models/app.model.dart';
import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/requests/base.request.dart';
import 'package:project/shared/services/store.service.dart';
import 'package:project/store/data_room/data_room.action.dart';
import 'package:reflectable/reflectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux/src/store.dart';

class ApiService {
  final _baseUris = {
    'gorest': 'https://gorest.co.in/public/v1',
    'ubike':
        'https://data.ntpc.gov.tw/api/datasets/71CD1490-A2DF-4198-BEF1-318479775E8A/json',
  };

  final _storeService = locator.get<StoreService>();

  BehaviorSubject<ApiData<T>> request<T>(
    BaseRequest request,
    Collection<T> collection,
  ) {
    var subject = BehaviorSubject<ApiData<T>>();
    var store = this._storeService.store;
    var uri = this.getUri(request)!;

    store.dispatch(DataRoomAction(type: ActionType.LOADING));

    http.get(uri).then(
      (res) {
        var mirror = imitable.reflectType(T) as ClassMirror;

        final action = DataRoomAction(
          type: ActionType.SUCCESS,
          payload: this.getPayload(request, res),
          request: request,
          mirror: mirror,
        );

        store.dispatch(action);

        subject.add(
          this.getApiData<T>(store, request, mirror)!,
        );
      },
    );

    return subject;
  }

  Uri? getUri(BaseRequest request) {
    switch (request.SCOPE) {
      case RequestScope.GOREST:
        return Uri.parse('${this._baseUris['gorest']}/${request.URI}');

      case RequestScope.UBIKE:
        return Uri.parse('${this._baseUris['ubike']}/${request.URI}');

      default:
        return null;
    }
  }

  ApiData<T>? getApiData<T>(
    Store<AppModel> store,
    BaseRequest request,
    ClassMirror mirror,
  ) {
    switch (request.SCOPE) {
      case RequestScope.GOREST:
        var data = store.state.DATA_ROOM!.COLLECTIONS![request.NAME]!.DATA!
            .map<T>(
              (item) => mirror.invoke('fromJson', [item.toJson()]) as T,
            )
            .toList();

        var meta = store.state.DATA_ROOM!.COLLECTIONS![request.NAME]!.META!;

        return ApiData<T>(
          STATUS: store.state.DATA_ROOM!.STATUS!,
          COLLECTION: Collection<T>(META: meta, DATA: data),
        );

      case RequestScope.UBIKE:
        var data = store.state.DATA_ROOM!.COLLECTIONS![request.NAME]!.DATA!
            .map<T>(
              (item) => mirror.invoke('fromJson', [item.toJson()]) as T,
            )
            .toList();

        return ApiData<T>(
          STATUS: store.state.DATA_ROOM!.STATUS!,
          COLLECTION: Collection<T>(META: null, DATA: data),
        );

      default:
        return null;
    }
  }

  Map<String, dynamic>? getPayload(BaseRequest request, http.Response res) {
    switch (request.SCOPE) {
      case RequestScope.GOREST:
        return jsonDecode(res.body);

      case RequestScope.UBIKE:
        return {'meta': null, 'data': jsonDecode(res.body)};

      default:
        return null;
    }
  }
}
