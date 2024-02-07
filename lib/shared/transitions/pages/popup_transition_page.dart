import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopupTransitionPage<T> extends CustomTransitionPage<T> {
  PopupTransitionPage({
    required super.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 100),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, anim, secAnim, child) {
            const begin = 0.9;
            const end = 1.0;
            final tween = Tween(begin: begin, end: end);
            return ScaleTransition(
              scale: anim.drive(tween),
              child: child,
            );
          },
        );
}
