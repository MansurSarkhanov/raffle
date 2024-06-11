import 'package:flutter/material.dart';

enum RoutingLocation { leftToRight, rightToLeft, upToDown }

class RouteHelper {
  static Route createRoute({required Widget routeName, required RoutingLocation location}) {
    Offset startOffset;
    switch (location) {
      case RoutingLocation.leftToRight:
        startOffset = const Offset(-1.0, 0.0);
        break;
      case RoutingLocation.rightToLeft:
        startOffset = const Offset(1.0, 0.0);
        break;
      case RoutingLocation.upToDown:
        startOffset = const Offset(0.0, 1.0);
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => routeName,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: startOffset, end: Offset.zero).chain(CurveTween(curve: Curves.easeIn));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 550),
    );
  }
}
