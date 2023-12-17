import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class EmptyRouterPage extends AutoRouter {
  EmptyRouterPage()
      : super(
          placeholder: (_) => SizedBox.expand(),
        );
}
