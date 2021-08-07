class BaseRequest {
  String name;
}

class UserRequest extends BaseRequest {
  UserRequest() {
    this.name = 'users';
  }
}
