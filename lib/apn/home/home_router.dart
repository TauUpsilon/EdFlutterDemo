import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/featured/home/home_view.dart';
import 'package:go_router/go_router.dart';

final homeRouter = ShellRoute(
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: '/${AppRoutes.home.path}',
      name: AppRoutes.home.name,
      builder: (context, state) => HomeView(
        testone: '',
        testtwo: Test(subtest: 'subtest'),
      ),
    ),
  ],
);
