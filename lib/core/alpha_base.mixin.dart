import 'package:flutter/widgets.dart';
import 'package:flutter_proj/shares/services/logging.service.dart';
import 'package:flutter_proj/states/redux/global_store/global.reducer.dart';
import 'package:flutter_proj/states/redux/mask_store/mask.reducer.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

mixin class AlphaBase {
  final logger = GetIt.instance.get<LoggingService>();
  final globalStore = GetIt.instance.get<Store<GlobalState>>();

  get routerState => globalStore.state.router;

  @protected
  void addMask(String clientName) {
    globalStore.dispatch(
      MaskAction.addMaskClient(clientName),
    );
  }

  @protected
  void removeMask(String clientName) {
    globalStore.dispatch(
      MaskAction.popMaskClient(clientName),
    );
  }
}
