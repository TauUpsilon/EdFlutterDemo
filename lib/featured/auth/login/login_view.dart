import 'package:eyr/app/app_widget.dart';
import 'package:eyr/featured/auth/login/login_cubit.dart';
import 'package:eyr/featured/auth/login/login_state.dart';
import 'package:eyr/localised/localiser.g.dart';
import 'package:eyr/shared/fields/password/password_field.dart';
import 'package:eyr/shared/mixins/common_viewable.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_paramable_annotation/json_paramable_annotation.dart';

part 'login_view.g.dart';

@JsonSerializable(
  ignoreUnannotated: true,
)
@JsonParamable()
class LoginView extends StatelessWidget with CommonViewable {
  @JsonKey()
  final String redirectUrl;

  @JsonKey()
  final Map<String, dynamic>? redirectExtra;

  const LoginView({
    this.redirectUrl = '',
    this.redirectExtra,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBar(title: AppConfig.appTitle),
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
                  _form,
                  _loginButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _form => BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) => Form(
          key: context.read<LoginCubit>().formKey,
          child: Column(
            children: [
              _passwordInput,
            ],
          ),
        ),
      );

  Widget get _passwordInput => BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) => Focus(
          focusNode: state.passwordField.focusNode,
          child: TextFormField(
            key: state.passwordField.key,
            controller: state.passwordField.controller,
            decoration: InputDecoration(
              helperText: Localiser.of(context).fieldPasswordHint,
              helperMaxLines: 2,
              labelText: Localiser.of(context).fieldPasswordLabel,
              errorMaxLines: 2,
            ),
            validator: (value) =>
                state.passwordField.validator(value ?? '')?.toMessage(
                      context,
                    ),
            obscureText: true,
            textInputAction: TextInputAction.done,
            onChanged: (value) => context.read<LoginCubit>().onPasswordChange(
                  value,
                ),
            onFieldSubmitted: (_) async => context.read<LoginCubit>().login(
                  Uri.tryParse(redirectUrl),
                  redirectExtra,
                ),
            onTapOutside: (_) => state.passwordField.focusNode.unfocus(),
          ),
          onFocusChange: (hasFocus) => !hasFocus
              ? state.passwordField.key.currentState?.validate()
              : null,
        ),
      );

  Widget get _loginButton => BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) => Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () async => context.read<LoginCubit>().login(
                  Uri.tryParse(redirectUrl),
                  redirectExtra,
                ),
            child: Text(
              Localiser.of(context).wordLogin,
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('redirectUrl', redirectUrl))
      ..add(
        DiagnosticsProperty<Map<String, dynamic>>(
          'redirectExtra',
          redirectExtra,
        ),
      );
  }
}
