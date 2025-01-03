import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/providers/theme_provider.dart';
import '../../auth/presentation/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: AppTextStyles.body.copyWith(
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeNotifier.toggleTheme(context),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "This is Home Screen",
          style: AppTextStyles.body.copyWith(
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
      ),
    );
  }
}
