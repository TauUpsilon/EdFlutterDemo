part of 'login_view.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());

  final _auth = GetIt.I<AuthCubit>();
  final _router = GetIt.I<GoRouter>();

  final _formKey = GlobalKey<FormState>();

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
    if (!_formKey.currentState!.validate()) return;

    _auth.login();

    _router.replace(
      redirectUrl?.path ?? AppRoutes.home.fullpath,
      extra: redirectExtra,
    );
  }
}
