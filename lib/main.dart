import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/features/auth/presentation/Reset_page.dart';
import 'package:select_sports/features/auth/presentation/forgot_page.dart';
import 'package:select_sports/features/auth/presentation/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/features/auth/presentation/signup_page.dart';
import 'package:select_sports/features/auth/presentation/verifyOTP_page.dart';
import 'package:select_sports/features/home/presentation/home_screen.dart';
import 'package:select_sports/features/home/presentation/playground_details_screen.dart';
import 'package:select_sports/features/main/presentation/main_screen.dart';
import 'package:select_sports/features/onboarding/presentation/onboarding_screen.dart';
import 'package:select_sports/features/profile/presentation/profile_screen.dart';
import 'package:select_sports/features/splash/presentation/splash_screen.dart';
import 'package:select_sports/providers/theme_provider.dart';
import 'package:toastification/toastification.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  await SharedPreferencesHelper.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return ToastificationWrapper(
        child: MaterialApp(
          title: 'Select Sports',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: AppColors.lightGreenColor,
            primaryColorDark: AppColors.darkGreenColor,
            scaffoldBackgroundColor: AppColors.lightBackground,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: AppColors.darkGreenColor,
            scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          themeMode: themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
            '/onboarding': (context) => OnboardingScreen(),
            '/main': (context) => MainScreen(),
            '/forgot':(context) => ForgotScreen(),
            '/verifyOTP':(context) => VerifyOTPScreen(), 
            '/reset':(context) => ResetScreen(),
            '/profile': (context) => ProfileScreen(),
            '/playground-details': (context) => PlaygroundDetailsScreen(),
          },
        ),
      );
    });
  }
}
