import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/core/widgets/custom_textfields.dart';
import 'package:select_sports/features/auth/utils/validators.dart';
import 'package:select_sports/features/settings/presentation/setting_controller.dart';
import 'package:select_sports/providers/theme_provider.dart';

class UpdateMobileScreen extends ConsumerStatefulWidget {
  const UpdateMobileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateMobileScreenState();
}

class _UpdateMobileScreenState extends ConsumerState<UpdateMobileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final settingController = ref.read(settingControllerProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
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
                        Paths.loginFootballImage,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Update",
                        style: AppTextStyles.largeHeading.copyWith(
                          color: AppColors.lightText,
                        ),
                      ),
                      Text(
                        "Contact",
                        style: AppTextStyles.largeHeading.copyWith(
                          color: AppColors.lightText,
                        ),
                      ),
                      SizedBox(height: 2.5.w),
                      Text(
                        "Enter a new Contact to update it.",
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.lightText,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 7.5.h,
                  left: 5.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.5.w,
                        vertical: 2.5.w,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.lightGreenColor,
                          borderRadius: BorderRadius.circular(2.5.w),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
          child: Column(
            children: [
              CustomTextFields.outlined(
                controller: settingController.phoneController,
                hintText: "Enter current mobile number",
                labelText: "Current Mobile",
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhone,
                ref: ref,
              ),
              SizedBox(height: 3.h),
              CustomTextFields.outlined(
                controller: settingController.newPhoneController,
                hintText: "Enter new mobile number",
                labelText: "New Mobile",
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhone,
                ref: ref,
              ),
              SizedBox(height: 5.h),
              CustomButtons.fullWidthFilledButton(
                ref: ref,
                buttonText: "Update Mobile Number",
                onClick: () {
                  _submitForm();
                },
                customDarkColor: AppColors.lightGreenColor,
                customLightColor: AppColors.lightGreenColor,
              ),
            ],
          ),
        ),
        ],
      ),
    ),)
    ,
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _updateMobileNumber();
    }
  }

  Future<void> _updateMobileNumber() async {
    final result =
    await ref.read(settingControllerProvider.notifier).updateContact();

    if (result['success']) {
      CustomSnackBar.showSuccess(result["message"]);
      Navigator.pushNamed(context, '/profile');
    } else {
      CustomSnackBar.showError(result["message"]);
    }
  }
}
