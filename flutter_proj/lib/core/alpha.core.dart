import 'package:flutter_proj/shares/services/logging.service.dart';
import 'package:flutter_proj/states/redux/global_store/global_reducer.redux.dart';
import 'package:flutter_proj/states/redux/mask_store/mask_reducer.redux.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

mixin class AlphaCore {
  final logger = GetIt.instance.get<LoggingService>();
  final globalStore = GetIt.instance.get<Store<GlobalState>>();

  void addMask(String clientName) {
    globalStore.dispatch(
      MaskReduxAction.addMaskClient(clientName),
    );
  }

  void removeMask(String clientName) {
    globalStore.dispatch(
      MaskReduxAction.removeMaskClient(clientName),
    );
  }
}
