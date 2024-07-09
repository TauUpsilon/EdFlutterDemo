import 'dart:async';

import 'package:flutter/widgets.dart';

// ignore: one_member_abstracts
abstract mixin class RouteGuard {
  FutureOr<String?> checkRedirect(BuildContext context, Object state);
}

extension RouteGuardExt on BuildContext {
  FutureOr<String?> defend({
    required List<RouteGuard Function()> guards,
    required Object state,
  }) async {
    String? url;

    for (final guard in guards) {
      url = await guard.call().checkRedirect(this, state);

      break;
    }

    return url;
  }
}
