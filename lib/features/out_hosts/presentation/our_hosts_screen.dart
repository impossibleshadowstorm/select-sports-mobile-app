import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class OurHostsScreen extends ConsumerStatefulWidget {
  const OurHostsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OurHostsScreenState();
}

class _OurHostsScreenState extends ConsumerState<OurHostsScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.transparent : Color(0xFFEBF0EA),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VisibilityWidgets.statusBarVisibleWidget(context: context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CommonAppbar.appbarWithoutLeading(
                context,
                isDarkMode,
                "Our Hosts",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.w),
                      // Header Section
                      Text(
                        "Become a Game Changer with Select Sports as a Lead Coordinator",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.lightGreyColor
                              : AppColors.darkText,
                        ),
                      ),
                      SizedBox(height: 2.5.w),
                      Text(
                        "At Select Sports, we know that exceptional coordinators are the backbone of every thrilling sports event. Our Lead Coordinators don’t just manage games—they’re the spark that brings energy, connection, and excitement to every match, making sure every participant walks away with a story to tell.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode
                              ? AppColors.lightGreyColor
                              : AppColors.darkGreyColor,
                        ),
                      ),
                      SizedBox(height: 2.5.w),
                      Text(
                        "As a Lead Coordinator, you’ll be the cornerstone of our events, carefully chosen and trained by Prime Play to reflect our passion for top-tier experiences. You’ll orchestrate seamless, dynamic games that balance competition with camaraderie, leaving a lasting impression on players and spectators alike.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode
                              ? AppColors.lightGreyColor
                              : AppColors.darkGreyColor,
                        ),
                      ),
                      SizedBox(height: 7.5.w),

                      Text(
                        "How It Works?",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkGreenColor,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkGreenColor,
                        ),
                      ),
                      SizedBox(height: 5.w),
                      Text(
                        "Turn your love for sports into an opportunity to inspire and connect with others while supplementing your income.",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 15.sp,
                          color: isDarkMode
                              ? AppColors.lightGreyColor
                              : AppColors.darkText,
                        ),
                      ),
                      SizedBox(height: 5.w),
                      Text(
                        "What Lead Coordinators do:",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 2.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Orchestrate dynamic sports events",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 15.sp,
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Ensure every game is memorable and engaging",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 15.sp,
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Embody the Prime Play spirit and values",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 15.sp,
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                        ],
                      ),
                      SizedBox(height: 5.w),
                      Text(
                        "Who we are looking for:",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 2.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Text(
                                  "Enthusiastic individuals 18+ with a passion for sports",
                                  style: AppTextStyles.body.copyWith(
                                    fontSize: 15.sp,
                                    color: isDarkMode
                                        ? AppColors.lightGreyColor
                                        : AppColors.darkText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Excellent interpersonal and organizational skills",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 15.sp,
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Dedicated to a long-term role",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 15.sp,
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.lightGreyColor
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Text(
                                  "Available for at least 3 events per week, including both weekdays and weekends",
                                  style: AppTextStyles.body.copyWith(
                                    fontSize: 15.sp,
                                    color: isDarkMode
                                        ? AppColors.lightGreyColor
                                        : AppColors.darkText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                        ],
                      ),
                      SizedBox(height: 5.w),
                      SizedBox(height: 10.w),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
