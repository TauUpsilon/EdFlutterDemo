part of 'login_view.dart';

class LoginCubit extends Cubit<LoginState> with CommonFuncable {
  final authCubit = GetIt.I<AuthCubit>();

  LoginCubit() : super(LoginInitial.init());

  Future<void> login(Uri? redirect) async {
    authCubit.login();

    router.replace(redirect?.path ?? AppRoutes.home.fullpath);
  }
}
