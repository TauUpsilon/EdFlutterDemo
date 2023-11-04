import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/shares/services/logging.service.dart';
import 'package:flutter_proj/states/redux/global_store/global.reducer.dart';
import 'package:flutter_proj/states/redux/router_store/router.reducer.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

mixin Alpha {
  GetIt get injector => GetIt.instance;
  LoggingService get logger => injector.get<LoggingService>();
  AppRouter get router => injector.get<AppRouter>();

  // State
  Store<GlobalState> get globalState => injector.get<Store<GlobalState>>();
  RouterState get routerState => globalState.state.router;
}
