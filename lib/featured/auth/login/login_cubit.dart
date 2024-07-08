part of 'login_view.dart';

class LoginCubit extends Cubit<LoginState> with CommonFuncable {
  final formKey = GlobalKey<FormState>();
  final authCubit = GetIt.I<AuthCubit>();

  LoginCubit() : super(LoginState.init());

  void onPasswordChange(String value) {
    emit(
      state.copyWith(
        passwordField: PasswordField.dirty(
          field: state.passwordField,
          value: value,
        ),
      ),
    );
  }

  Future<void> login(
    Uri? redirectUrl,
    Map<String, dynamic>? redirectExtra,
  ) async {
    if (!formKey.currentState!.validate()) return;

    authCubit.login();

    router.replace(
      redirectUrl?.path ?? AppRoutes.home.fullpath,
      extra: redirectExtra,
    );
  }
}
