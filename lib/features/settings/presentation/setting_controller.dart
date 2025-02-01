import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/features/settings/data/setting_repository.dart';

class SettingState {
  final bool passwordVisible;
  final bool newPasswordVisible;
  final bool confirmPasswordVisible;

  SettingState({
    required this.passwordVisible,
    required this.newPasswordVisible,
    required this.confirmPasswordVisible,
  });

  // CopyWith method for immutability
  SettingState copyWith({
    bool? passwordVisible,
    bool? newPasswordVisible,
    bool? confirmPasswordVisible,
    bool? currentPasswordVisible,
  }) {
    return SettingState(
      passwordVisible: passwordVisible ?? this.passwordVisible,
      newPasswordVisible: newPasswordVisible ?? this.newPasswordVisible,
      confirmPasswordVisible:
          confirmPasswordVisible ?? this.confirmPasswordVisible,
    );
  }
}

class SettingController extends StateNotifier<SettingState> {
  final SettingRepository settingRepository;

  // Text controllers for login and signup forms
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController newPhoneController = TextEditingController();

  SettingController(this.settingRepository)
      : super(SettingState(
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
    state =
        state.copyWith(confirmPasswordVisible: !state.confirmPasswordVisible);
  }

  Future<Map<String, dynamic>> reset() {
    return settingRepository.reset(passwordController.text.trim(),
        newPasswordController.text.trim());
  }

  Future<Map<String, dynamic>> updateContact() {
    return settingRepository.updateContact(phoneController.text.trim(),
        newPhoneController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

final settingControllerProvider =
    StateNotifierProvider<SettingController, SettingState>(
  (ref) => SettingController(ref.read(settingRepositoryProvider)),
);
