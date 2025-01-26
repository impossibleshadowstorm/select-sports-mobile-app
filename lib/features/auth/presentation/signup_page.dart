import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/core/widgets/custom_textfields.dart';
import 'package:select_sports/features/auth/presentation/auth_controller.dart';
import 'package:select_sports/features/auth/utils/validators.dart';
import '../../../providers/theme_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
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
                              Paths.signupFootballImage,
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
                              "Register",
                              style: AppTextStyles.largeHeading.copyWith(
                                color: AppColors.lightText,
                              ),
                            ),
                            SizedBox(height: 2.5.w),
                            Text(
                              "Create your account",
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.5.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.w),
                      CustomTextFields.outlined(
                        controller: authController.nameController,
                        hintText: "john Doe",
                        labelText: "Name",
                        validator: Validators.validateName,
                        ref: ref,
                      ),
                      SizedBox(height: 5.w),
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
                        obscureText: !authState.passwordVisible,
                        validator: Validators.validatePassword,
                        ref: ref,
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
                          setState(() {
                            authController.togglePasswordVisibility();
                          });
                        },
                      ),
                      SizedBox(height: 5.w),
                      CustomTextFields.outlined(
                        controller: authController.phoneController,
                        hintText: "899034****",
                        labelText: "Phone",
                        keyboardType: TextInputType.phone,
                        validator: Validators.validatePhone,
                        ref: ref,
                      ),
                      SizedBox(height: 5.w),
                      CustomTextFields.outlined(
                        controller: authController.ageController,
                        hintText: "xx",
                        labelText: "Age",
                        keyboardType: TextInputType.number,
                        validator: Validators.validateAge,
                        ref: ref,
                      ),
                      SizedBox(height: 5.w),
                      CustomButtons.fullWidthFilledButton(
                        ref: ref,
                        buttonText: "Sign up",
                        onClick: () {
                          _submitForm();
                        },
                      ),
                      SizedBox(height: 5.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account? ",
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
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "Login here.",
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
                      SizedBox(height: 10.w),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _signup();
    }
  }

  Future<void> _signup() async {
    final result = await ref.read(authControllerProvider.notifier).signup();

    if (mounted) {
      if (result['success']) {
        CustomSnackBar.showSuccess(
            "${result['message']}. Please login using credentials.");
        Navigator.pushNamed(context, '/login');
      } else {
        CustomSnackBar.showError(result['message']);
      }
    }
  }
}
