import 'package:project/main.locator.dart';
import 'package:project/shared/models/api_response.model.dart';
import 'package:project/shared/models/user.model.dart';
import 'package:project/shared/requests/user.request.dart';
import 'package:project/shared/services/api.service.dart';
import 'package:rxdart/rxdart.dart';

class UserService {
  final _apiService = locator.get<ApiService>();

  BehaviorSubject<ApiResponse<User>> userSubject =
      BehaviorSubject<ApiResponse<User>>();

  void requestUserData(UserRequest request) {
    this._apiService.request<User>(request, userSubject);
  }

  Stream<ApiResponse<User>> getUserDataStore() {
    var userRequest = UserRequest();
    requestUserData(userRequest);

    return userSubject;
  }

  // RSAA getMoreUsers(String page) {
  //   return RSAA(
  //     method: 'GET',
  //     endpoint: '${this._baseUri}/users?$page',
  //     types: [
  //       USERS_REQ_LOADING,
  //       USERS_REQ_SUCCESS,
  //       USERS_REQ_FAILURE,
  //     ],
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );
  // }
  // https://gorest.co.in/public/v1/users?page=2
}
