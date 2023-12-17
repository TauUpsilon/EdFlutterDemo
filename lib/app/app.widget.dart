import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eyr/api/api.service.dart';
import 'package:eyr/api/todos/todos.service.dart';
import 'package:eyr/app/app.widget.gr.dart';
// import 'package:eyr/shares/guards/home-route.guard.dart';
import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/observers/app_router.observer.dart';
import 'package:eyr/shares/services/logging.service.dart';
import 'package:eyr/shares/services/rsa.service.dart';
import 'package:eyr/states/cubit/mask/mask_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

part 'app.config.dart';
part 'app.initor.dart';
part 'app.router.dart';
part 'package:eyr/shares/utils/string.util.dart';

class App extends StatelessWidget with CommonFunctionable {
  App({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: maskCubit),
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.delegate(
              placeholder: (_) => SizedBox.expand(),
              navigatorObservers: () => [
                AppRouterObserver(),
              ],
            ),
            routeInformationProvider: router.routeInfoProvider(),
            routeInformationParser: router.defaultRouteParser(),
          ),
          BlocBuilder<MaskCubit, MaskState>(
            builder: (context, state) {
              return Visibility(
                visible: state.clients.isNotEmpty,
                child: Container(
                  color: Color.fromARGB(166, 0, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
