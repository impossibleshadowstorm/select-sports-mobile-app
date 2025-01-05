import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/bottom_nav_visibility.dart';
import '../../../providers/theme_provider.dart';
import '../../auth/presentation/auth_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider);

    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    // Access ThemeNotifier for toggling the theme
    final themeNotifier = ref.read(themeProvider.notifier);

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.darkGreyColor),
                    ),
                    child: Center(
                      child: Container(
                        height: 37.5.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.darkGreyColor),
                        ),
                        child: Center(
                          child: Container(
                            height: 31.h,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            // child: Image(image: Net),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                            SizedBox(height: 5.w),
                            Column(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                  ),
                                ),
                                Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                  ),
                                ),
                                BottomNavBarVisibility
                                    .bottomNavBarVisibleWidget(height: 140),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
