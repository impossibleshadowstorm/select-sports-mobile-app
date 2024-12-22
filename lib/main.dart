import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/features/auth/presentation/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:select_sports/features/auth/presentation/signup_page.dart';
import 'package:select_sports/features/home/presentation/home_screen.dart';
import 'package:select_sports/features/onboarding/presentation/onboarding_screen.dart';
import 'package:select_sports/features/splash/presentation/splash_screen.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return ToastificationWrapper(
        child: MaterialApp(
          title: 'Select Sports',
          debugShowCheckedModeBanner: false,
          theme: FlexThemeData.light(
            scheme: FlexScheme.greenM3,
            usedColors: 7,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 4,
            appBarStyle: FlexAppBarStyle.background,
            bottomAppBarElevation: 1.0,
            subThemesData: const FlexSubThemesData(
              interactionEffects: true,
              tintedDisabledControls: true,
              blendOnLevel: 10,
              useM2StyleDividerInM3: true,
              thickBorderWidth: 2.0,
              filledButtonRadius: 4.0,
              elevatedButtonRadius: 4.0,
              elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
              elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
              inputDecoratorSchemeColor: SchemeColor.primary,
              inputDecoratorIsFilled: true,
              inputDecoratorBackgroundAlpha: 12,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorRadius: 8.0,
              inputDecoratorUnfocusedHasBorder: false,
              inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
              alignedDropdown: true,
              appBarScrolledUnderElevation: 8.0,
              drawerElevation: 1.0,
              drawerWidth: 290.0,
              bottomSheetRadius: 27.0,
              bottomSheetElevation: 5.0,
              bottomNavigationBarSelectedLabelSchemeColor:
                  SchemeColor.secondary,
              bottomNavigationBarMutedUnselectedLabel: false,
              bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
              bottomNavigationBarMutedUnselectedIcon: false,
              searchBarElevation: 1.0,
              searchViewElevation: 1.0,
              searchUseGlobalShape: true,
              navigationBarSelectedLabelSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationBarSelectedIconSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
              navigationBarElevation: 1.0,
              navigationBarHeight: 72.0,
              navigationRailSelectedLabelSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationRailSelectedIconSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationRailUseIndicator: true,
              navigationRailIndicatorSchemeColor:
                  SchemeColor.secondaryContainer,
              navigationRailIndicatorOpacity: 1.00,
              navigationRailLabelType: NavigationRailLabelType.all,
            ),
            useMaterial3ErrorColors: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
          ),
          darkTheme: FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.greenM3]!.light.defaultError
                .toDark(40, false),
            usedColors: 7,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 10,
            appBarStyle: FlexAppBarStyle.background,
            bottomAppBarElevation: 2.0,
            subThemesData: const FlexSubThemesData(
              interactionEffects: true,
              tintedDisabledControls: true,
              blendOnLevel: 20,
              blendOnColors: true,
              useM2StyleDividerInM3: true,
              thickBorderWidth: 2.0,
              filledButtonRadius: 4.0,
              elevatedButtonRadius: 4.0,
              elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
              elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
              inputDecoratorSchemeColor: SchemeColor.primary,
              inputDecoratorIsFilled: true,
              inputDecoratorBackgroundAlpha: 48,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorRadius: 8.0,
              inputDecoratorUnfocusedHasBorder: false,
              inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
              alignedDropdown: true,
              drawerElevation: 1.0,
              drawerWidth: 290.0,
              bottomSheetRadius: 27.0,
              bottomSheetElevation: 5.0,
              bottomNavigationBarSelectedLabelSchemeColor:
                  SchemeColor.secondary,
              bottomNavigationBarMutedUnselectedLabel: false,
              bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
              bottomNavigationBarMutedUnselectedIcon: false,
              searchBarElevation: 1.0,
              searchViewElevation: 1.0,
              searchUseGlobalShape: true,
              navigationBarSelectedLabelSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationBarSelectedIconSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
              navigationBarElevation: 1.0,
              navigationBarHeight: 72.0,
              navigationRailSelectedLabelSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationRailSelectedIconSchemeColor:
                  SchemeColor.onSecondaryContainer,
              navigationRailUseIndicator: true,
              navigationRailIndicatorSchemeColor:
                  SchemeColor.secondaryContainer,
              navigationRailIndicatorOpacity: 1.00,
              navigationRailLabelType: NavigationRailLabelType.all,
            ),
            useMaterial3ErrorColors: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
          ),
          themeMode: ThemeMode.dark,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
            '/onboarding': (context) => OnboardingScreen(),
            '/home': (context) => HomeScreen(),
          },
        ),
      );
    });
  }
}
