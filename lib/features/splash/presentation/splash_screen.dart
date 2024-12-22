import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:select_sports/features/splash/presentation/splash_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserState();
  }

  // Method to check user state after 2 seconds delay
  Future<void> _checkUserState() async {
    // Delay for 2 seconds
    await Future.delayed(const Duration(milliseconds: 2700));

    // Check if the widget is still mounted to avoid async gap issues
    if (!mounted) return;

    final splashController = ref.read(splashControllerProvider);

    // Directly navigate based on the logic
    splashController.redirectTo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie_jsons/splash_logo.json",
            animate: true,
          ),
          Text(
            "Select Sports",
          ),
        ],
      ),
    );
  }
}
