import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/featured/component/component.page.dart';
import 'package:eyr/featured/home/home.page.dart';
import 'package:eyr/featured/nested/_featured/nested_one.page.dart';
import 'package:eyr/featured/nested/_featured/nested_two.page.dart';
import 'package:eyr/featured/nested/_featured/sub_nested/sub_nested.page.dart';
import 'package:eyr/featured/nested/nested.page.dart';
import 'package:eyr/featured/network/network.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter.routingConfig(
  navigatorKey: AppNavigator.rootKey,
  debugLogDiagnostics: true,
  routingConfig: appRoutingConfig,
);

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
            child: const HomePage(),
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
        builder: (context, state) => const ComponentPage(),
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

extension AppRouterExt on GoRouter {
  Future<void> pushAndPopUntil(
    String location,
    String until, {
    Object? extra,
  }) async {
    popUntil(until);
    push(location, extra: extra);
  }

  Future<void> pushNamedAndPopUntil(
    String name,
    String until, {
    Object? extra,
  }) async {
    popUntil(name);
    pushNamed(name, extra: extra);
  }

  void popUntilRoot() {
    while (canPop()) {
      pop();
    }
  }

  void popUntil(String target) {
    final list = routerDelegate.currentConfiguration.routes.toList();

    for (final route in list.reversed) {
      if (route is GoRoute) {
        if (route.path == target || route.name == target) break;
        if (!canPop()) break;
        pop();
      }

      if (list.elementAt(list.indexOf(route) - 1) is ShellRoute) {
        routerDelegate.currentConfiguration.matches.removeLast();
      }
    }
  }
}

abstract class AppRoute {
  final AppRoute? _parent;

  AppRoute({
    AppRoute? parent,
  }) : _parent = parent;

  String get path;
  String get name => fullpath;
  String get fullpath => '${_parent?.fullpath ?? ''}/$path';
}
