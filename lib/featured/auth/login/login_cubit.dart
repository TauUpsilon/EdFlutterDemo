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

  Future<void> login(Uri? redirect) async {
    if (!formKey.currentState!.validate()) return;

    // authCubit.login();

    // router.replace(redirect?.path ?? AppRoutes.home.fullpath);
  }
}
