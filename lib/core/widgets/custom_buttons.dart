import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';

import '../../providers/theme_provider.dart';

class CustomButtons {
  static Widget fullWidthFilledButton({
    required String buttonText,
    required WidgetRef ref,
    required Function onClick,
    Color? customDarkColor,
    Color? customLightColor,
  }) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 3.5.w,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 3.5.w,
        ),
        decoration: BoxDecoration(
          color: isDarkMode
              ? (customDarkColor ?? AppColors.darkGreyColor)
              : (customLightColor ?? AppColors.lightGreenColor),
          borderRadius: BorderRadius.circular(2.5.w),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
