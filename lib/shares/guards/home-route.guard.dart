import 'package:auto_route/auto_route.dart';
// import 'package:eyr/app/app.widget.gr.dart';

class HomeRouteGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // resolver.redirect(HomeRoute());
  }
}
