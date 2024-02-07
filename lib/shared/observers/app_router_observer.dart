import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

mixin class AppRoutingObserver {
  GoRouter get router => GetIt.I<GoRouter>();

  void didRouteChanged() {
    final routingInfo = router.routeInformationProvider.value;
    final routingUri = routingInfo.uri;
    final routingState = routingInfo.state;

    if (routingState == null) return;

    _handleRouteInformationState(routingState, routingUri);
    _handleRouteMapState(routingState);
  }

  void _handleRouteInformationState(Object state, Uri uri) {
    if (state is! RouteInformationState) return;
    switch (state.type) {
      case NavigatingType.push:
      case NavigatingType.pushReplacement:
      case NavigatingType.replace:
      case NavigatingType.go:
      case NavigatingType.restore:
        break;
    }
  }

  // Currently, state would be set to Map as runtime type only on pop navigation
  void _handleRouteMapState(Object state) {
    if (state is! Map) return;
  }
}

extension RouteWidgetsBinding on WidgetsBinding {
  GoRouter get router => GetIt.I<GoRouter>();

  void addRouteObserver(AppRoutingObserver observer) {
    router.routerDelegate.addListener(() => observer.didRouteChanged());
  }

  void removeRouteObserver(AppRoutingObserver observer) {
    router.routerDelegate.removeListener(() => observer.didRouteChanged());
  }
}
