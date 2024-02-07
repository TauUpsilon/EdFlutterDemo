import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_enum.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'init_state.dart';

class InitCubit extends Cubit<void>
    with WidgetsBindingObserver, CommonFuncable {
  final _maskCubit = GetIt.I<AppMaskCubit>();
  final _appLifecycle = StreamController<AppLifecycleState>();

  bool isAppLifeCycleWatched = false;
  bool isDeeplinkListened = false;

  InitCubit() : super(null) {
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> prepare() async {
    if (!isAppLifeCycleWatched) await _watchAppLifeCycle();
    if (!isDeeplinkListened) await _listenDeeplink();
  }

  Future<void> _watchAppLifeCycle() async {
    _appLifecycle.stream.listen(
      (event) => switch (event) {
        AppLifecycleState.detached || AppLifecycleState.resumed => () {
            _maskCubit.popMaskClient(
              AppMaskConst.persistentClient.name,
              AppMaskType.covering,
            );
          },
        AppLifecycleState.inactive => () {
            _maskCubit.addMaskClient(
              AppMaskConst.persistentClient.name,
              AppMaskType.covering,
            );
          },
        AppLifecycleState.hidden || AppLifecycleState.paused => () {}
      },
      onError: (err) {
        logger.e('WatchAppLifeCycle $err');
      },
    );

    isAppLifeCycleWatched = true;
  }

  Future<void> _listenDeeplink() async {
    // _handleDeeplink(
    //   await getInitialUri(),
    // );

    // uriLinkStream.listen(
    //   (uri) async => _handleDeeplink(uri),
    //   onError: (err) {
    //     logger.e('ListenDeeplink $err');
    //   },
    // );

    isDeeplinkListened = true;
  }

  // Future<void> _handleDeeplink(Uri? uri) async {
  //   if (uri != null && uri.host.contains('')) {
  //     await Future.delayed(const Duration(milliseconds: 100));
  //     router.goNamed(EzwtRoutes.queuer.explore.name);
  //   }
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycle.add(state);
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);

    return super.close();
  }
}
