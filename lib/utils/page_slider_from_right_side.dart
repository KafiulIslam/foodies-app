import 'package:flutter/material.dart';

class PageRoutingWithRightSlide extends PageRouteBuilder {
  final Widget widget;
  PageRoutingWithRightSlide({required this.widget})
      : super(

          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) =>
              widget,

          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(0.0, -1.0),
              ).animate(secAnimation),
              child: child,
            ),
          ),

          transitionDuration: const Duration(milliseconds: 100),

        );
}
