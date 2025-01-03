import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/constants/theme_constants.dart';

import '../../providers/theme_provider.dart';

class CustomTextStyles {
  static TextStyle heading({required WidgetRef ref}) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? AppColors.lightText : AppColors.darkText,
    );
  }

  static TextStyle subheading({required WidgetRef ref}) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: isDarkMode ? AppColors.lightText : AppColors.darkText,
    );
  }

  static TextStyle body({required WidgetRef ref}) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: isDarkMode ? AppColors.lightText : AppColors.darkText,
    );
  }
}
