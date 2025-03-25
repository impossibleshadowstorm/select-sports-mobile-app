import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/shared_preferences_keys.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/core/widgets/custom_textfields.dart';
import 'package:select_sports/features/auth/presentation/auth_controller.dart';
import 'package:select_sports/features/auth/utils/validators.dart';
import 'package:select_sports/features/main/presentation/main_screen.dart';
import 'package:select_sports/providers/theme_provider.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  DateTime? currentBackPressTime;
  bool canPopNow = false;
  int requiredSeconds = 2;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: KeyboardListener(
              focusNode: _focusNode,
              autofocus: true,
              onKeyEvent: (event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.enter) {
                  _submitForm();
                  FocusScope.of(context).unfocus(); // Dismiss keyboard
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.darkestBackground,
                          AppColors.darkMediumBackground,
                          AppColors.darkLightBackground,
                        ],
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Positioned(
                          top: 0.h,
                          left: 20.w,
                          child: SizedBox(
                            height: 35.h,
                            width: 100.w,
                            child: Image(
                              image: AssetImage(
                                Paths.loginFootballImage,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign in to your",
                                style: AppTextStyles.largeHeading.copyWith(
                                  color: AppColors.lightText,
                                ),
                              ),
                              Text(
                                "Account",
                                style: AppTextStyles.largeHeading.copyWith(
                                  color: AppColors.lightText,
                                ),
                              ),
                              SizedBox(height: 2.5.w),
                              Text(
                                "Access your account at fingertips",
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.lightText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.w),
                        CustomTextFields.outlined(
                          controller: authController.emailController,
                          hintText: "johndoe@gmail.com",
                          labelText: "Email",
                          validator: Validators.validateEmail,
                          ref: ref,
                        ),
                        SizedBox(height: 5.w),
                        CustomTextFields.outlinedWithIcon(
                          controller: authController.passwordController,
                          hintText: "**************",
                          labelText: "Password",
                          validator: Validators.validatePassword,
                          ref: ref,
                          obscureText: !authState.passwordVisible,
                          isPrefix: false,
                          icon: Icon(
                            authState.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: isDarkMode
                                ? AppColors.lightText
                                : AppColors.darkText,
                          ),
                          onIconPressed: () {
                            authController.togglePasswordVisibility();
                          },
                        ),
                        SizedBox(height: 5.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgot');
                          },
                          child: SizedBox(
                            width: 100.w,
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.right,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightGreenColor
                                    : AppColors.darkGreenColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        CustomButtons.fullWidthFilledButton(
                          ref: ref,
                          buttonText: "Login",
                          loading: authState.isLoginProcessRunning,
                          onClick: () {
                            _submitForm();
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        SizedBox(height: 5.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Have an account? ",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : AppColors.darkText,
                              ),
                            ),
                            InkWell(
                              overlayColor: WidgetStatePropertyAll(Colors.transparent),
                              onTap: () {
                                authController.resetLoginForm();
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                " Create here.",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.body.copyWith(
                                  color: isDarkMode
                                      ? AppColors.lightGreenColor
                                      : AppColors.darkGreenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPopInvoked(bool didPop) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;
      CustomSnackBar.showWarning("Press Again to exit..!");
      Future.delayed(
        Duration(seconds: requiredSeconds),
            () {
          setState(() {
            canPopNow = false;
          });
          toastification.dismissAll();
        },
      );
      // Ok, let user exit app on the next back press
      setState(() {
        canPopNow = true;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _login();
    }
  }

  Future<void> _login() async {
    // Check if the widget is still mounted before triggering UI updates
    final authController = ref.read(authControllerProvider.notifier);
    final result = await authController.login();

    if (mounted) {
      if (result['success']) {
        authController.resetLoginForm();

        CustomSnackBar.showSuccess(result["message"]);
        SharedPreferencesHelper.set(
          SharedPreferencesKeys.authToken,
          result['data']['token'],
        );
        SharedPreferencesHelper.set(
          SharedPreferencesKeys.userId,
          result['data']['userId'],
        );
        SharedPreferencesHelper.set(
          SharedPreferencesKeys.name,
          result['data']['name'],
        );
        SharedPreferencesHelper.set(
          SharedPreferencesKeys.email,
          result['data']['email'],
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainScreen()),
              (route) => false,
        );
      } else {
        CustomSnackBar.showError(result["message"]);
      }
    }
  }
}
