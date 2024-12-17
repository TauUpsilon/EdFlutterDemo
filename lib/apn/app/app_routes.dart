import 'package:eyr/apn/auth/auth_routes.dart';
import 'package:eyr/apn/common/common_routes.dart';
import 'package:eyr/apn/home/home_routes.dart';

mixin AppRoutes {
  static AuthRoute auth = AuthRoute();
  static HomeRoute home = HomeRoute();
  static CommonRoute common = CommonRoute();
}
