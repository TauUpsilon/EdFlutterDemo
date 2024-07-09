import 'dart:async';

import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/featured/auth/login/login_view.dart';
import 'package:eyr/shared/abstracts/route_guard.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AuthGuard with RouteGuard {
  @override
  FutureOr<String?> checkRedirect(BuildContext context, Object state) async {
    if (state is! GoRouterState) return null;

    if (!GetIt.I<AuthCubit>().state.isAuthenticated) {
      await GetIt.I<GoRouter>().pushNamed(
        AppRoutes.auth.login.name,
        extra: LoginParam(
          redirectUrl: state.uri.path,
          redirectExtra: state.extra as Map<String, dynamic>?,
        ).toExtra(),
      );

      throw Exception('$runtimeType -> Not auth...');
    }

    return null;
  }
}
