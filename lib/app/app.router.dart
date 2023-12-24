import 'package:eyr/features/component/component.page.dart';
import 'package:eyr/features/home/home.page.dart';
import 'package:eyr/features/nested/features/nested_one.page.dart';
import 'package:eyr/features/nested/features/nested_two.page.dart';
import 'package:eyr/features/nested/features/sub_nested/sub_nested.page.dart';
import 'package:eyr/features/nested/nested.page.dart';
import 'package:eyr/features/network/network.page.dart';
import 'package:flutter/foundation.dart';
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
              GoRoute(
                path: 'nested-two',
                builder: (context, state) {
                  return NestedTwoPage();
                },
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

// @override
// RouteType get defaultRouteType => RouteType.custom(
//       durationInMilliseconds: 100,
//       reverseDurationInMilliseconds: 100,
//       transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//       ) {
//         return ScaleTransition(
//           scale: animation.drive(
//             Tween<double>(begin: 0.9, end: 1),
//           ),
//           child: FadeTransition(
//             opacity: animation.drive(
//               Tween<double>(begin: 0, end: 1),
//             ),
//             child: child,
//           ),
//         );
//       },
//     );
