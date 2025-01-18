import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
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
                    Container(
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
                    SizedBox(height: 5.w),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        "Sumit Saurav",
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
                        "sumitsaurav1119@gmail.com",
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
