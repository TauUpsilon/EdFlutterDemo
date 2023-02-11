import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
import 'package:flutter_proj/api/services/mbm081018.service.dart';
import 'package:flutter_proj/featured/restful/store/restful.action.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

Future<void> restfulMiddleware(
  Store prev,
  dynamic action,
  NextDispatcher next,
) async {
  if (action is GetPartOne) {
    final mbm081018Service = GetIt.instance.get<MBM081018Service>();

    MBM081018Model mbm081018model = await mbm081018Service.getFxRate('');

    next(GetPartOne(mbm081018model: mbm081018model));
  }
}
