import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/features/about_us/presentation/about_us_screen.dart';
import 'package:select_sports/features/auth/presentation/Reset_page.dart';
import 'package:select_sports/features/auth/presentation/forgot_page.dart';
import 'package:select_sports/features/auth/presentation/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/features/auth/presentation/signup_page.dart';
import 'package:select_sports/features/auth/presentation/verifyOTP_page.dart';
import 'package:select_sports/features/available_slots/presentation/available_slots_screen.dart';
import 'package:select_sports/features/bookings/presentation/bookings_screen.dart';
import 'package:select_sports/features/main/presentation/main_screen.dart';
import 'package:select_sports/features/manage_teams/presentation/manage_teams_screen.dart';
import 'package:select_sports/features/onboarding/presentation/onboarding_screen.dart';
import 'package:select_sports/features/profile/presentation/profile_screen.dart';
import 'package:select_sports/features/rewards/presentation/reward_screen.dart';
import 'package:select_sports/features/settings/presentation/Reset_page.dart';
import 'package:select_sports/features/rewards/presentation/rewards_screen.dart';
import 'package:select_sports/features/settings/presentation/delete_account/delete_account_screen.dart';
import 'package:select_sports/features/settings/presentation/notification_preferences_screen.dart';
import 'package:select_sports/features/settings/presentation/settings_screen.dart';
import 'package:select_sports/features/settings/presentation/update_mobile_screen.dart';
import 'package:select_sports/features/splash/presentation/splash_screen.dart';
import 'package:select_sports/features/terms_and_conditions/presentation/terms_and_conditions_screen.dart';
import 'package:select_sports/features/upcoming_bookings/presentation/upcoming_bookings_screen.dart';
import 'package:select_sports/features/wallet/presentation/add_money_screen.dart';
import 'package:select_sports/features/wallet/presentation/wallet_screen.dart';
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
            '/join_a_game': (context) => AvailableSlotsScreen(),
            '/forgot': (context) => ForgotScreen(),
            '/verifyOTP': (context) => VerifyOTPScreen(),
            '/reset': (context) => ResetScreen(),
            '/profile': (context) => ProfileScreen(),
            '/wallet': (context) => WalletScreen(),
            '/upcoming_bookings': (context) => UpcomingBookingsScreen(),
            '/bookings': (context) => BookingsScreen(),
            '/addMoney': (context) => AddMoneyScreen(),
            '/settings': (context) => SettingsScreen(),
            '/manage_teams': (context) => ManageTeamsScreen(),
            '/about_us': (context) => AboutUsScreen(),
            '/terms_and_conditions': (context) => TermsAndConditionsScreen(),
            '/notification_preferences': (context) => NotificationPreferencesScreen(),
            '/delete_account': (context) => DeleteAccountScreen(),
            '/updatecontact' :(context) => UpdateMobileScreen()
            '/rewards':(context) => RewardsScreen(),
          },
        ),
      );
    });
  }
}
