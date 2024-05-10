import 'package:equatable/equatable.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/fields/password/password_field.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/mixins/common_viewable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
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
class LoginView extends StatelessWidget with CommonViewable {
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
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) => SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Redirect URL: $redirectUrl'),
                  Form(
                    key: context.read<LoginCubit>().formKey,
                    child: Column(
                      children: [
                        Focus(
                          focusNode: state.passwordField.focusNode,
                          child: TextFormField(
                            key: state.passwordField.key,
                            controller: state.passwordField.controller,
                            decoration: InputDecoration(
                              helperText: localiser.passwordHint,
                              helperMaxLines: 2,
                              labelText: localiser.passwordLabel,
                              errorMaxLines: 2,
                            ),
                            validator: (value) => state.passwordField
                                .validator(value ?? '')
                                ?.text,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            onChanged: (value) => context
                                .read<LoginCubit>()
                                .onPasswordChange(value),
                            onFieldSubmitted: (_) async =>
                                context.read<LoginCubit>().login(redirectUrl),
                            onTapOutside: (_) =>
                                state.passwordField.focusNode.unfocus(),
                          ),
                          onFocusChange: (value) => !value
                              ? state.passwordField.key.currentState?.validate()
                              : null,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async => context.read<LoginCubit>().login(
                            redirectUrl,
                          ),
                      child: Text(localiser.login),
                    ),
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
