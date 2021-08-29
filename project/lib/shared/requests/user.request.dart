import 'package:project/shared/requests/base.request.dart';

class UserGetRequest extends BaseRequest {
  UserGetRequest(String page) {
    this.method = RequestMethod.GET;
    this.name = 'users';
    this.uri = "${this.name}?${page}";
  }
}
