import 'package:project/shared/requests/base.request.dart';

class UserGetRequest extends BaseRequest {
  UserGetRequest(String page) {
    this.METHOD = RequestMethod.GET;
    this.NAME = 'users';
    this.URI = "${this.NAME}?${page}";
  }
}
