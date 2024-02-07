import 'package:eyr/app/app_widget.dart';
import 'package:eyr/apr/app_routes.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/widgets/header.widget.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'login_cubit.dart';
part 'login_state.dart';
part 'login_view.g.dart';

@RouteParamGenerable()
class LoginView extends StatelessWidget {
  final Uri? redirectUrl;

  const LoginView({
    super.key,
    this.redirectUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBarWidget(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Redirect URL: $redirectUrl'),
                  TextButton(
                    onPressed: () async => context.read<LoginCubit>().login(
                          redirectUrl,
                        ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Uri?>('redirectUrl', redirectUrl));
  }
}
