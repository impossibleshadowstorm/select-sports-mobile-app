import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/features/auth/presentation/auth_controller.dart';
import 'package:select_sports/features/auth/utils/validators.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.w),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "john Doe",
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: Validators.validateName,
                        ),
                        SizedBox(height: 5.w),
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
                          obscureText: true,
                          validator: Validators.validatePassword,
                        ),
                        SizedBox(height: 5.w),
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: "899034****",
                            labelText: "Phone",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: Validators.validatePhone,
                        ),
                        SizedBox(height: 5.w),
                        TextFormField(
                          controller: ageController,
                          decoration: InputDecoration(
                            hintText: "xx",
                            labelText: "age",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validator: Validators.validateAge,
                        ),
                        SizedBox(height: 5.w),
                        ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: Center(
                            child: Text(
                              "Sign up",
                            ),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: SizedBox(
                            width: 100.w,
                            child: Text(
                              "Already Have an account? Login here.",
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
      _signup();
    }
  }

  Future<void> _signup() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final phone = phoneController.text.trim();
    final age = ageController.text.trim();

    final result = await ref.read(authControllerProvider).signup(
          name,
          email,
          password,
          phone,
          age,
        );

    if (mounted) {
      if (result['success']) {
        CustomSnackBar.showSuccess(
            "${result['message']}. Please login using credentials.");
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        CustomSnackBar.showError(result['message']);
      }
    }
  }
}
