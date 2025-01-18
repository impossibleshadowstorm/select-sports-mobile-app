import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/constants/shared_preferences_keys.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/features/auth/data/auth_repository.dart';

class AuthState {
  final bool passwordVisible;
  final bool newPasswordVisible;
  final bool confirmPasswordVisible;

  AuthState({
    required this.passwordVisible,
    required this.newPasswordVisible,
    required this.confirmPasswordVisible,
  });

  // CopyWith method for immutability
  AuthState copyWith({
    bool? passwordVisible,
    bool? newPasswordVisible,
    bool? confirmPasswordVisible,
  }) {
    return AuthState(
      passwordVisible: passwordVisible ?? this.passwordVisible,
      newPasswordVisible: newPasswordVisible ?? this.newPasswordVisible,
      confirmPasswordVisible:
          confirmPasswordVisible ?? this.confirmPasswordVisible,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  // Text controllers for login and signup forms
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  AuthController(this.authRepository)
      : super(AuthState(
    passwordVisible: false,
    newPasswordVisible: false,
    confirmPasswordVisible: false,
  ));

  // Toggle password visibility
  void togglePasswordVisibility() {
    state = state.copyWith(passwordVisible: !state.passwordVisible);
  }

  void toggleNewPasswordVisibility() {
    state = state.copyWith(newPasswordVisible: !state.newPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(confirmPasswordVisible: !state.confirmPasswordVisible);
  }

  Future<Map<String, dynamic>> login() {
    return authRepository.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  Future<Map<String, dynamic>> signup() {
    return authRepository.signup(
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
      phoneController.text.trim(),
      ageController.text.trim(),
    );
  }

  Future<Map<String, dynamic>> forgot() {
    return authRepository.forgot(emailController.text.trim());
  }

  Future<Map<String, dynamic>> verify() {
    return authRepository.verifyOtp(
        emailController.text.trim(), otpController.text.trim());
  }

  Future<Map<String, dynamic>> reset() {
    return authRepository.reset(emailController.text.trim(),
        otpController.text.trim(), newPasswordController.text.trim());
  }

  Future<bool> logout() async {
    await SharedPreferencesHelper.clear();
    // After logging out User must not be redirected to Onboarding Page
    await SharedPreferencesHelper.set(
        SharedPreferencesKeys.alreadyVisited, true);
    CustomSnackBar.showSuccess("Successfully logged out.");
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
      (ref) => AuthController(ref.read(authRepositoryProvider)),
);
