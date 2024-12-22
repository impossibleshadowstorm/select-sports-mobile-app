import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/shared_preferences_keys.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/features/auth/presentation/auth_controller.dart';
import 'package:select_sports/features/auth/utils/validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.w),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "johndoe@gmail.com",
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: Validators.validateEmail,
                        ),
                        SizedBox(height: 5.w),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "**************",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: Validators.validatePassword,
                        ),
                        SizedBox(height: 5.w),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            "Forgot Password?",
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 5.w),
                        ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: Center(
                            child: Text(
                              "Login",
                            ),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: SizedBox(
                            width: 100.w,
                            child: Text(
                              "Don't Have an account? Create here.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
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
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _login();
    }
  }

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Check if the widget is still mounted before triggering UI updates
    final result =
        await ref.read(authControllerProvider).login(email, password);

    if (mounted) {
      if (result['success']) {
        CustomSnackBar.showSuccess(result["message"]);
        SharedPreferencesHelper.set(
          SharedPreferencesKeys.authToken,
          result['data'],
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        CustomSnackBar.showError(result["message"]);
      }
    }
  }
}
