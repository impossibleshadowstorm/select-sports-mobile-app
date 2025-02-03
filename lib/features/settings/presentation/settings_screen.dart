import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            VisibilityWidgets.statusBarVisibleWidget(context: context),
            CommonAppbar.appbarWithoutLeading(
              context,
              isDarkMode,
              "Settings",
            ),
            // _buildActionTile(
            //   isDarkMode,
            //   Paths.menuSettingIcon,
            //   "Edit Profile",
            //   "Change your name, description and other profile related stuffs..",
            //   () {
            //     // Navigator.pushNamed(context, "/edit_profile");
            //   },
            // ),
            SizedBox(height: 5.w),
            _buildActionTile(
              isDarkMode,
              Paths.menuSettingIcon,
              "Change Mobile Number",
              "change your Phone number at ease",
                  () {
                Navigator.pushNamed(context, "/update_mobile");
              },
            ),
            SizedBox(height: 5.w),
            _buildActionTile(
              isDarkMode,
              Paths.menuSettingIcon,
              "Notification Preferences",
              "Define what alerts and notifications you want to see",
              () {
                Navigator.pushNamed(context, "/notification_preferences");
              },
            ),
            SizedBox(height: 5.w),
            _buildActionTile(
              isDarkMode,
              Paths.menuSettingIcon,
              "Account Settings",
              "Delete you Account Permanently",
              () {
                Navigator.pushNamed(context, "/delete_account");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(
    bool isDarkMode,
    String icon,
    String title,
    String subTitle,
    Function onClick,
  ) {
    return InkWell(
      onTap: () {
        onClick();
      },
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 2.w,
        ),
        width: 100.w,
        decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.darkGreyColor
              : AppColors.lightestGreyColorV2,
          borderRadius: BorderRadius.circular(2.5.w),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              height: 50,
              width: 50,
              child: Center(
                child: SvgPicture.asset(
                  Paths.settingsProfileIcon,
                  height: 25,
                  width: 25,
                  color: AppColors.lightText,
                ),
              ),
            ),
            SizedBox(width: 2.5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body.copyWith(
                      color: isDarkMode
                          ? AppColors.lightText
                          : AppColors.darkText.withValues(alpha: 0.8),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body.copyWith(
                      color: isDarkMode
                          ? AppColors.lightText.withValues(alpha: 0.7)
                          : AppColors.darkText.withValues(alpha: 0.6),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 2.5.w),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: isDarkMode
                  ? AppColors.lightText.withValues(alpha: 0.8)
                  : AppColors.darkText.withValues(alpha: 0.3),
              size: 15.sp,
            ),
            SizedBox(width: 2.5.w),
          ],
        ),
      ),
    );
  }
}
