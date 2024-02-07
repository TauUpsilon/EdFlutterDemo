part of 'login_view.dart';

class LoginCubit extends Cubit<LoginState> with CommonFuncable {
  LoginCubit() : super(LoginInitial.init());
}
