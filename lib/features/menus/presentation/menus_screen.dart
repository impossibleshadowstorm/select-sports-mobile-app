import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/shared_preferences_keys.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/features/auth/presentation/auth_controller.dart';
import 'package:select_sports/features/auth/presentation/login_page.dart';
import 'package:select_sports/features/main/presentation/main_controller.dart';
import 'package:select_sports/providers/theme_provider.dart';

class MenusScreen extends ConsumerStatefulWidget {
  const MenusScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MenusScreenState();
}

class _MenusScreenState extends ConsumerState<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    // Access ThemeNotifier for toggling the theme
    final themeNotifier = ref.read(themeProvider.notifier);
    final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: 100.w,
                child: Column(
                  children: [
                    VisibilityWidgets.statusBarVisibleWidget(
                      context: context,
                      additionalHeight: 50,
                    ),
                    Hero(
                      tag: "profile-icon",
                      child: Container(
                        height: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              Paths.profileImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.w),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        SharedPreferencesHelper.get(
                                SharedPreferencesKeys.name) ??
                            "---",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subheading.copyWith(
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        SharedPreferencesHelper.get(
                                SharedPreferencesKeys.email) ??
                            "---",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(
                          color: isDarkMode
                              ? AppColors.lightGreyColor
                              : AppColors.darkText,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: CustomButtons.fullWidthFilledButton(
                        buttonText: "View Profile",
                        ref: ref,
                        onClick: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Accounts",
                            style: AppTextStyles.subheading.copyWith(
                              color: AppColors.mediumGreyColor,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuWalletIcon,
                            "Wallet",
                            () {
                              Navigator.pushNamed(context, "/wallet");
                            },
                          ),
                          // Divider(
                          //   color: isDarkMode
                          //       ? AppColors.darkGreyColor
                          //       : AppColors.lightestGreyColorV3,
                          // ),
                          // _buildOptionTile(
                          //   isDarkMode,
                          //   Paths.menuUpcomingIcon,
                          //   "Upcoming Bookings",
                          //   () {
                          //     themeNotifier.toggleTheme(context);
                          //   },
                          // ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuBookingIcon,
                            "Bookings",
                            () {
                              Navigator.pushNamed(context, "/bookings");
                            },
                          ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuRewardsIcon,
                            "Rewards",
                            () {
                              Navigator.pushNamed(context, "/rewards");
                            },
                          ),
                          //
                          SizedBox(height: 2.5.h),
                          Text(
                            "Teams & Hosts",
                            style: AppTextStyles.subheading.copyWith(
                              color: AppColors.mediumGreyColor,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuManageTeamsIcon,
                            "Manage Teams",
                            () {
                              Navigator.pushNamed(context, "/manage_teams");
                            },
                          ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuOurHostsIcons,
                            "Our Hosts",
                            () {
                              // Navigator.pushNamed(context, "/main");
                              // themeNotifier.toggleTheme(context);
                            },
                          ),
                          //
                          SizedBox(height: 2.5.h),
                          Text(
                            "Accounts",
                            style: AppTextStyles.subheading.copyWith(
                              color: AppColors.mediumGreyColor,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuNeedHelpIcon,
                            "Need Help",
                            () {
                              Navigator.pushNamed(context, "/need_help");
                            },
                          ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.menuSettingIcon,
                            "Settings",
                            () {
                              Navigator.pushNamed(context, "/settings");
                            },
                          ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.settingsAboutUsIcon,
                            "About Us",
                            () {
                              Navigator.pushNamed(context, "/about_us");
                            },
                          ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          _buildOptionTile(
                            isDarkMode,
                            Paths.settingsTermsAndConditionsIcon,
                            "Terms & Conditions",
                            () {
                              Navigator.pushNamed(
                                  context, "/terms_and_conditions");
                            },
                          ),
                          Divider(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightestGreyColorV3,
                          ),
                          InkWell(
                            onTap: () {
                              authController.logout();
                              ref
                                  .read(mainControllerProvider.notifier)
                                  .updateIndex(2);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (Route<dynamic> route) =>
                                    false, // Removes all previous routes
                              );
                            },
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          Paths.settingsTermsAndConditionsIcon,
                                          height: 25,
                                          width: 25,
                                          color: AppColors.redColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "Log Out",
                                      style: AppTextStyles.subheading.copyWith(
                                        // color: AppColors.lightText.withValues(alpha: 0.9),
                                        color: AppColors.redColor,
                                        fontSize: 15.sp,
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
                  ],
                ),
              ),
              VisibilityWidgets.bottomNavBarVisibleWidget(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(
    bool isDarkMode,
    String icon,
    String menuTitle,
    Function onClick,
  ) {
    return InkWell(
      onTap: () {
        onClick();
      },
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                    color:
                        isDarkMode ? AppColors.lightText : AppColors.darkText,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                menuTitle,
                style: AppTextStyles.subheading.copyWith(
                  // color: AppColors.lightText.withValues(alpha: 0.9),
                  color: isDarkMode
                      ? AppColors.lightText.withValues(alpha: 0.9)
                      : AppColors.darkText,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
