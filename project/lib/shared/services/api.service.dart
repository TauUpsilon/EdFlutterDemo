import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/main.locator.dart';
import 'package:project/shared/decorators/imitable.decorator.dart';
import 'package:project/shared/models/api_data.model.dart';
import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/requests/base.request.dart';
import 'package:project/shared/services/store.service.dart';
import 'package:project/store/data_room/data_room.action.dart';
import 'package:reflectable/reflectable.dart';
import 'package:rxdart/rxdart.dart';

class ApiService {
  final _baseUri = 'https://gorest.co.in/public/v1';
  final _storeService = locator.get<StoreService>();

  BehaviorSubject<ApiData<T>> request<T>(
    BaseRequest request,
    Collection<T> collection,
  ) {
    var subject = BehaviorSubject<ApiData<T>>();
    var store = this._storeService.store;
    var uri = Uri.parse('${this._baseUri}/${request.URI}');

    store.dispatch(DataRoomAction(type: ActionType.LOADING));

    http.get(uri).then(
      (res) {
        var mirror = imitable.reflectType(T) as ClassMirror;

        final action = DataRoomAction(
          type: ActionType.SUCCESS,
          payload: jsonDecode(res.body),
          request: request,
          mirror: mirror,
        );

        store.dispatch(action);

        var data = store.state.DATA_ROOM!.COLLECTIONS![request.NAME]!.DATA!
            .map<T>(
              (item) => mirror.invoke('fromJson', [item.toJson()]) as T,
            )
            .toList();

        var meta = store.state.DATA_ROOM!.COLLECTIONS![request.NAME]!.META!;

        subject.add(
          ApiData<T>(
            STATUS: store.state.DATA_ROOM!.STATUS!,
            COLLECTION: Collection<T>(META: meta, DATA: data),
          ),
        );
      },
    );

    return subject;
  }
}
