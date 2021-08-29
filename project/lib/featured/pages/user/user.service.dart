import 'package:project/main.locator.dart';
import 'package:project/shared/models/api_data.model.dart';
import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/models/user.model.dart';
import 'package:project/shared/requests/user.request.dart';
import 'package:project/shared/services/api.service.dart';

class UserService {
  final _apiService = locator.get<ApiService>();

  // void requestUserData(UserGetRequest request) {
  //   this._apiService.request<User>(request, userSubject);
  // }

  Stream<ApiData<User>> getUsers(String pageNum) {
    var userRequest = UserGetRequest(pageNum);
    var userCollection = new Collection<User>();

    return this._apiService.request(userRequest, userCollection);
  }
}
