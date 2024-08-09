import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HeaderBar extends StatelessWidget {
  final String title;

  HeaderBar({
    required this.title,
    super.key,
  });

  final _router = GetIt.I.get<GoRouter>();

  @override
  Widget build(BuildContext context) => AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
        elevation: 20,
        leading: _router.canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _router.pop,
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              MediaQuery.of(context).size.height,
              200,
            ),
          ),
        ),
        actions: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) => state.isAuthenticated
                ? IconButton(
                    onPressed: () {
                      GetIt.I<AuthCubit>().logout();

                      _router.goNamed(AppRoutes.home.fullpath);
                    },
                    icon: const Icon(Icons.logout),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
