import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import '../../../providers/theme_provider.dart';
import '../../auth/presentation/auth_controller.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider);

    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    // Access ThemeNotifier for toggling the theme
    final themeNotifier = ref.read(themeProvider.notifier);

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
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: const Center(child: Text('Profile Screen')),
    );
  }
}
