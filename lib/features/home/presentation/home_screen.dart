import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/frosted_glass.dart';
import 'package:select_sports/providers/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.w),
                  bottomRight: Radius.circular(5.w),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 60.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Paths.homePlaygroundImage,
                        ),
                        opacity: 0.4,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.w),
                        bottomRight: Radius.circular(5.w),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.darkGreenColor.withValues(alpha: 0.4),
                          AppColors.darkGreenColor.withValues(alpha: 0.2),
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.w),
                        bottomRight: Radius.circular(5.w),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    padding: EdgeInsets.all(7.5),
                                    decoration: BoxDecoration(
                                      color: AppColors.darkGreenColor,
                                      borderRadius:
                                          BorderRadius.circular(2.5.w),
                                    ),
                                    child: SvgPicture.asset(
                                      Paths.homeFootballPlayerIcon,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Playing techniques',
                                    style: AppTextStyles.subheading.copyWith(
                                      color: AppColors.lightText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Hello,',
                                style: AppTextStyles.largeHeading.copyWith(
                                  color: AppColors.lightText,
                                ),
                              ),
                              Text(
                                'Sumit Saurav',
                                style: AppTextStyles.largeHeading.copyWith(
                                  color: AppColors.lightText,
                                ),
                              ),
                              SizedBox(height: 2.5.w),
                              Text(
                                'Welcome to your Playground.!',
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.lightText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        FrostedGlassBox(
                          width: 100.w,
                          height: 70,
                          clipRectBorder: BorderRadius.only(
                            bottomLeft: Radius.circular(5.w),
                            bottomRight: Radius.circular(5.w),
                          ),
                          containerBorder: BorderRadius.only(
                            bottomLeft: Radius.circular(5.w),
                            bottomRight: Radius.circular(5.w),
                          ),
                          child: Row(
                            children: [],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Box So that the data behind the bottom bar must be visible..
            Container(
              height: 70,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
