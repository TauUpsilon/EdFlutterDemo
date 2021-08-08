import 'package:project/shared/requests/base.request.dart';

class UserRequest extends BaseRequest {
  UserRequest() {
    this.name = 'users';
  }
}
