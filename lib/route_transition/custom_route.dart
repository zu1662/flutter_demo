import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  /**
   * slideType side类型
   * left right top bottom
   */
  final String slideType;

  CustomRoute(this.widget, [this.slideType])
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context, Animation animation,
                Animation secondAnimation, Widget widget) {
              // Fade route
              // return FadeTransition(
              //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //       parent: animation, curve: Curves.easeInOut)),
              //   child: widget,
              // );

              // Scale route
              // return ScaleTransition(
              //   scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //       parent: animation, curve: Curves.easeInOut)),
              //   child: widget,
              // );

              // Slide route
              return SlideTransition(
                position: Tween<Offset>(
                        begin: getSlideOffset(slideType), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                child: widget,
              );
            });

  // Get Offset by slideType
  static Offset getSlideOffset(String slideType) {
    switch (slideType) {
      case "left":
        return Offset(-1.0, 0.0);
      case "top":
        return Offset(0.0, -1.0);
      case "bottom":
        return Offset(0.0, 1.0);
      default: // right
        return Offset(1.0, 0.0);
    }
  }
}
