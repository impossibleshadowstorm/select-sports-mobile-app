// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:select_sports/core/constants/paths.dart';
// import 'package:select_sports/core/constants/theme_constants.dart';
// import 'package:select_sports/core/widgets/common_appbar.dart';
// import 'package:select_sports/core/widgets/common_dropdowns.dart';
// import 'package:select_sports/core/widgets/custom_buttons.dart';
// import 'package:select_sports/core/widgets/custom_snackbar.dart';
// import 'package:select_sports/core/widgets/custom_textfields.dart';
// import 'package:select_sports/core/widgets/visibility_widgets.dart';
// import 'package:select_sports/features/auth/utils/validators.dart';
// import 'package:select_sports/features/profile/presentation/profile_controller.dart';
// import 'package:select_sports/providers/theme_provider.dart';

// class UpdateProfileScreen extends ConsumerStatefulWidget {
//   const UpdateProfileScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _UpdateProfileScreenState();
// }

// class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(profileControllerProvider.notifier).fetchSportsProfile();
//     });
//     final profileController = ref.read(profileControllerProvider.notifier);
//     profileController.fetchUserProfile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Check if the current theme mode is dark
//     final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;
//     final profileState = ref.watch(profileControllerProvider);
//     final profileNotifier = ref.read(profileControllerProvider.notifier);

//     if (profileState.isProfileLoading) {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       body: SizedBox(
//         height: 100.h,
//         width: 100.w,
//         child: Padding(
//           padding:  EdgeInsets.symmetric(horizontal: 3.0.w),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   VisibilityWidgets.statusBarVisibleWidget(context: context),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5.w),
//                     child: CommonAppbar.appbarWithoutLeading(
//                       context,
//                       isDarkMode,
//                       "Edit Profile",
//                     ),
//                   ),
//                   SizedBox(height: 15.w),
//                   Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       Container(
//                         height: 17.h,
//                         width: 17.h,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             image: NetworkImage(Paths.profileImage),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 5,
//                         right: 5,
//                         child: InkWell(
//                           onTap: () {
//                             CustomSnackBar.showError('This Service Not Available Currently!');
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: Icon(
//                               Icons.camera_alt,
//                               color: Colors.black,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 1.0.h,
//                   ),
//                   Text(
//                     'Sumitsaurav@gmail.com',
//                     style: AppTextStyles.subheading
//                         .copyWith(color: AppColors.lightText),
//                   ),
//                   SizedBox(height: 10.w),
//                   CustomTextFields.outlined(
//                     controller: profileNotifier.nameController,
//                     hintText: "john Doe",
//                     labelText: "Name",
//                     validator: Validators.validateName,
//                     ref: ref,
//                   ),
//                   SizedBox(height: 5.w),
//                   CustomTextFields.outlined(
//                     controller: profileNotifier.phoneController,
//                     hintText: "899034****",
//                     labelText: "Phone",
//                     keyboardType: TextInputType.phone,
//                     validator: Validators.validatePhone,
//                     ref: ref,
//                   ),
//                   SizedBox(height: 5.w),
//                   CustomTextFields.outlined(
//                     controller: profileNotifier.dobController,
//                     hintText: "24-02-2024",
//                     labelText: "DOB",
//                     keyboardType: TextInputType.datetime,
//                     validator: Validators.validateDob,
//                     ref: ref,
//                     enabled: false,
//                     onClick: () {
//                       profileNotifier.openDobPicker();
//                       profileNotifier.selectDate(context);
//                     },
//                   ),
//                   SizedBox(height: 5.w),
//                   CommonDropdown(
//                     items: CommonAppOptions.genders,
//                     selectedValue: profileState.gender,
//                     onChanged: (value) {
//                       if (value != null) {
//                         profileNotifier.changeGenderSelection(value);
//                       }
//                     },
//                   ),
//                   SizedBox(height: 5.w),
//                   CustomButtons.fullWidthFilledButton(
//                     ref: ref,
//                     buttonText: "Update Profile",
//                     loading: profileState.isUpdateProcessRunning,
//                     onClick: () {
//                       _submitForm();
//                     },
//                   ),
//                   SizedBox(height: 5.w),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState?.validate() ?? false) {
//       _signup();
//     }
//   }

//   Future<void> _signup() async {
//     final profileController = ref.read(profileControllerProvider.notifier);
//     final result = await profileController.updateProfile();
//     if (mounted) {
//       if (result['success']) {
//         CustomSnackBar.showSuccess("${result['message']}");

//         Navigator.pushNamed(context, '/profile');
//       } else {
//         CustomSnackBar.showError(result['message']);
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/common_dropdowns.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/custom_snackbar.dart';
import 'package:select_sports/core/widgets/custom_textfields.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/features/auth/utils/validators.dart';
import 'package:select_sports/features/profile/presentation/profile_controller.dart';
import 'package:select_sports/providers/theme_provider.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileControllerProvider.notifier).fetchSportsProfile();
    });
    final profileController = ref.read(profileControllerProvider.notifier);
    profileController.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.light;
    final profileState = ref.watch(profileControllerProvider);
    final profileNotifier = ref.read(profileControllerProvider.notifier);

    if (profileState.isProfileLoading) {
      return Scaffold(
        backgroundColor: isDarkMode
            ? AppColors.darkScaffoldBackground
            : AppColors.lightBackground,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkScaffoldBackground : AppColors.lightBackground,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  VisibilityWidgets.statusBarVisibleWidget(context: context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CommonAppbar.appbarWithoutLeading(
                      context,
                      isDarkMode,
                      "Edit Profile",
                    ),
                  ),
                  SizedBox(height: 15.w),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 17.h,
                        width: 17.h,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.mediumGreyColor
                              : AppColors.lightGreyBackground,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(Paths.profileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: InkWell(
                          onTap: () {
                            CustomSnackBar.showError(
                                'This Service Not Available Currently!');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDarkMode
                                  ? AppColors.mediumGreyColor
                                  : Colors.white,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: isDarkMode
                                  ? AppColors.lightText
                                  : Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.0.h),
                  Text(
                    'Sumitsaurav@gmail.com',
                    style: AppTextStyles.subheading.copyWith(
                      color:
                          isDarkMode ? AppColors.lightText : AppColors.darkText,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  CustomTextFields.outlined(
                    controller: profileNotifier.nameController,
                    hintText: "John Doe",
                    labelText: "Name",
                    validator: Validators.validateName,
                    ref: ref,
                  ),
                  SizedBox(height: 5.w),
                  CustomTextFields.outlined(
                    controller: profileNotifier.phoneController,
                    hintText: "899034****",
                    labelText: "Phone",
                    keyboardType: TextInputType.phone,
                    validator: Validators.validatePhone,
                    ref: ref,
                  ),
                  SizedBox(height: 5.w),
                  CustomTextFields.outlined(
                    controller: profileNotifier.dobController,
                    hintText: "24-02-2024",
                    labelText: "DOB",
                    keyboardType: TextInputType.datetime,
                    validator: Validators.validateDob,
                    ref: ref,
                    enabled: false,
                    onClick: () {
                      profileNotifier.openDobPicker();
                      profileNotifier.selectDate(context);
                    },
                  ),
                  SizedBox(height: 5.w),
                  CommonDropdown(
                    items: CommonAppOptions.genders,
                    selectedValue: profileState.gender,
                    onChanged: (value) {
                      if (value != null) {
                        profileNotifier.changeGenderSelection(value);
                      }
                    },
                  ),
                  SizedBox(height: 5.w),
                  CustomButtons.fullWidthFilledButton(
                    ref: ref,
                    buttonText: "Update Profile",
                    loading: profileState.isUpdateProcessRunning,
                    onClick: () {
                      _submitForm();
                    },
                  ),
                  SizedBox(height: 5.w),
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
    final profileController = ref.read(profileControllerProvider.notifier);
    final result = await profileController.updateProfile();
    if (mounted) {
      if (result['success']) {
        CustomSnackBar.showSuccess("${result['message']}");
        Navigator.pushNamed(context, '/profile');
      } else {
        CustomSnackBar.showError(result['message']);
      }
    }
  }
}
