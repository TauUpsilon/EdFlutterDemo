import 'package:eyr/features/component/component.page.dart';
import 'package:eyr/features/home/home.page.dart';
import 'package:eyr/features/nested/features/nested_one.page.dart';
import 'package:eyr/features/nested/features/nested_two.page.dart';
import 'package:eyr/features/nested/features/sub_nested/sub_nested.page.dart';
import 'package:eyr/features/nested/nested.page.dart';
import 'package:eyr/features/network/network.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRoutingConfig = ValueNotifier<RoutingConfig>(
  RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => HomeCubit()),
            ],
            child: HomePage(),
          );
        },
      ),
      GoRoute(
        path: '/network',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => NetworkCubit()),
            ],
            child: NetworkPage(
              test: '',
            ),
          );
        },
      ),
      GoRoute(
        path: '/component',
        builder: (context, state) => ComponentPage(),
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NestedCubit(),
              ),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/nested',
            builder: (context, state) {
              return NestedPage();
            },
            routes: [
              GoRoute(
                path: 'nested-one',
                builder: (context, state) {
                  return NestedOnePage(
                    test: '',
                  );
                },
              ),
              ShellRoute(
                navigatorKey: GlobalKey<NavigatorState>(),
                builder: (context, state, child) => Container(
                  child: child,
                ),
                routes: [
                  GoRoute(
                    path: 'nested-two',
                    builder: (context, state) {
                      return NestedTwoPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'sub-nested',
                builder: (context, state) {
                  return SubNestedPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

extension GoRouterExt on GoRouter {
  bool maybePop() {
    if (canPop()) pop();
    return canPop();
  }

  void pushAndPopUntil(
    String location,
    String until, {
    Object? extra,
  }) {
    popUntil(until);
    push(location, extra: extra);
  }

  void pushNamedAndPopUntil(
    String name,
    String until, {
    Object? extra,
  }) {
    popUntil(name);
    pushNamed(name, extra: extra);
  }

  void popUntilRoot() {
    while (canPop()) {
      pop();
    }
  }

  void popUntil(String? target) {
    var routes = routerDelegate.currentConfiguration.routes;
    var route = routerDelegate.currentConfiguration.routes.last;

    while (canPop()) {
      final cIndex = routes.indexOf(route);

      if (routes.elementAt(cIndex - 1) is ShellRoute) {
        routerDelegate.currentConfiguration.matches.removeLast();
      }

      if (route is GoRoute) {
        if (route.path == target || route.name == target) break;
        if (!canPop()) break;
        pop();
      }

      routes = routerDelegate.currentConfiguration.routes;
      route = routes.last;
    }
  }
}
