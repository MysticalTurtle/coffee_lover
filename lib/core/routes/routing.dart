import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class FadePageRoute<T> extends CustomTransitionPage<T> {
  FadePageRoute({
    required this.newPage,
    super.key,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          // key: key,
          child: newPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: duration,
        );
  final Widget newPage;
}
