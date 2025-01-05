import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBarVisibility {
  static Widget bottomNavBarVisibleWidget({double height = 70}) {
    return Container(
      height: height,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}
