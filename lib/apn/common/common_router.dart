import 'package:eyr/apn/app/app_routes.dart';
import 'package:eyr/featured/common/test/test_view.dart';
import 'package:go_router/go_router.dart';

final commonRouter = ShellRoute(
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: '/${AppRoutes.common.path}',
      name: AppRoutes.common.name,
      redirect: (context, state) => null,
      routes: [
        GoRoute(
          path: '/${AppRoutes.common.test.path}',
          name: AppRoutes.common.test.name,
          // redirect: (context, state) => context.defend(
          //   guards: [
          //     AuthGuard.new,
          //   ],
          //   state: state,
          // ),
          builder: (context, state) => CommonTestParam.getView(
            state.extra as Map<String, dynamic>? ?? {},
          ),
        ),
      ],
    ),
  ],
);
