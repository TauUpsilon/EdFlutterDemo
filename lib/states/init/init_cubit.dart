import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eyr/shared/mixins/subscribable.dart';
import 'package:eyr/shared/observers/app_router_observer.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/states/mask/mask_cubit.dart';
import 'package:eyr/states/mask/mask_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'init_state.dart';

class InitCubit extends Cubit<void>
    with WidgetsBindingObserver, AppRouterObserver, Subscribable {
  InitCubit() : super(null) {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addRouterObserver(this);
  }

  final _mask = GetIt.I<MaskCubit>();
  final _logger = GetIt.I<LoggingService>();

  final _appLifecycle = StreamController<AppLifecycleState>();

  bool isAppLifeCycleWatched = false;
  bool isDeeplinkListened = false;

  Future<void> prepare() async {
    if (!isAppLifeCycleWatched) await _watchAppLifeCycle();
    if (!isDeeplinkListened) await _listenDeeplink();
  }

  Future<void> _watchAppLifeCycle() async {
    addSubscription(
      _appLifecycle.stream.listen(
        (event) => switch (event) {
          AppLifecycleState.detached || AppLifecycleState.resumed => () {
              _mask.popMaskClient(
                MaskConst.persistentClient.name,
                type: MaskType.loading,
                isForciblyChange: _mask.state.isForciblyChange,
              );
            }.call(),
          AppLifecycleState.inactive => () {
              _mask.addMaskClient(
                MaskConst.persistentClient.name,
                type: MaskType.covering,
                isForciblyChange: _mask.state.isON,
              );
            }.call(),
          AppLifecycleState.hidden || AppLifecycleState.paused => () {
              _mask.popMaskClient(
                MaskConst.persistentClient.name,
              );
            }.call()
        },
        onError: (err) {
          _logger.e('WatchAppLifeCycle $err');
        },
      ),
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
    WidgetsBinding.instance.removeRouterObserver(this);

    cancelSubscriptions();

    return super.close();
  }
}
