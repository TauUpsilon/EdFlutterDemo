import 'package:eyr/apn/app_routes.dart';
import 'package:go_router/go_router.dart';

final commonRouter = GoRoute(
  path: '/${AppRoutes.common.path}',
  name: AppRoutes.common.name,
  redirect: (context, state) => null,
);
