import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_proj/api/api.service.dart';
import 'package:flutter_proj/api/todos/todos.service.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:flutter_proj/features/component/component.page.dart';
import 'package:flutter_proj/features/home/home.page.dart';
import 'package:flutter_proj/features/network/network.page.dart';
import 'package:flutter_proj/shares/services/logging.service.dart';
import 'package:flutter_proj/states/redux/global_store/global.reducer.dart';
import 'package:flutter_proj/states/redux/router_store/router.reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

part 'app.config.dart';
part 'app.locator.dart';
part 'app.router.dart';
part 'app.util.dart';

class App extends StatelessWidget {
  const App({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: GetIt.instance.get<Store<GlobalState>>(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: AppRouter.generateRoute,
            navigatorObservers: [AppRouteObserver()],
          ),
          StoreConnector<GlobalState, GlobalState>(
            converter: (store) => store.state,
            builder: (context, vm) {
              if (vm.mask.clients.isNotEmpty) {
                return Container(
                  color: Colors.transparent,
                  width: 1000,
                  height: 1000,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
