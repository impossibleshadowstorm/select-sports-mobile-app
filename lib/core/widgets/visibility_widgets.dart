import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VisibilityWidgets {
  static Widget bottomNavBarVisibleWidget({double height = 70}) {
    return Container(
      height: height,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }

  static Widget statusBarVisibleWidget({
    required BuildContext context,
    double additionalHeight = 0,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).viewPadding.top + additionalHeight,
    );
  }
}
