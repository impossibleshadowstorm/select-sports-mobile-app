import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.radius = 0.0,
    this.padding,
    this.clipRectBorder,
    this.containerBorder,
  });

  final double width;
  final double height;
  final Widget child;
  final double radius;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? clipRectBorder;
  final BorderRadiusGeometry? containerBorder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: clipRectBorder ?? BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        // we use Stack();
        // because we want the effects be on top of each other,
        // just like layer in photoshop.
        child: Stack(
          children: [
            //blur effect ==> the third layer of stack
            BackdropFilter(
              filter: ImageFilter.blur(
                //sigmaX is the Horizontal blur
                sigmaX: 4.0,
                //sigmaY is the Vertical blur
                sigmaY: 4.0,
              ),
              // we use this container to scale up the blur effect to fit its
              // parent, without this container the blur effect doesn't appear.
              child: Container(),
            ),
            // gradient effect ==> the second layer of stack
            Container(
              decoration: BoxDecoration(
                borderRadius: containerBorder ?? BorderRadius.circular(radius),
                border: Border.all(
                  color: Colors.white.withValues(
                    alpha: 0.13,
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.green.withValues(alpha: 0.15),
                    Colors.green.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
            // child ==> the first/top layer of stack
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
