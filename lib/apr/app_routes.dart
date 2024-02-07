import 'package:eyr/apr/auth/auth_routes.dart';
import 'package:eyr/apr/home/home_routes.dart';
import 'package:eyr/apr/network/network_routes.dart';

mixin AppRoutes {
  static AuthRoute auth = AuthRoute();
  static HomeRoute home = HomeRoute();
  static NetworkRoute network = NetworkRoute();
}
