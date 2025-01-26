import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/core/widgets/frosted_glass.dart';
import 'package:select_sports/providers/theme_provider.dart';
import '../../main/presentation/main_controller.dart';

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
              // Top Landing Section
              _buildLandingSection(isDarkMode),
              SizedBox(height: 5.w),
              // Actions Section
              _buildActionsSection(ref, context),
              SizedBox(height: 10.w),
              // Our Playgrounds Section
              _buildPlaygroundsSection(isDarkMode),
              SizedBox(height: 10.w),
              // Box So that the data behind the bottom bar must be visible..
              VisibilityWidgets.bottomNavBarVisibleWidget(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaygroundsSection(
    bool isDarkMode,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Our Playgrounds",
            textAlign: TextAlign.start,
            style: AppTextStyles.subheading.copyWith(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
            ),
          ),
          SizedBox(height: 2.5.w),
          SizedBox(
            height: 340,
            width: 100.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Hero(
                      tag: "Hero$index",
                      // flightShuttleBuilder: (flightContext, animation,
                      //     direction, fromContext, toContext) {
                      //   return Center(child: CircularProgressIndicator());
                      // },
                      transitionOnUserGestures: true,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/playground-details');
                        },
                        child: Container(
                          height: 320,
                          width: 75.w,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.darkScaffoldBackground
                                : Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(2.5.w),
                            boxShadow: [
                              BoxShadow(
                                color: isDarkMode
                                    ? AppColors.lightGreenColor
                                        .withValues(alpha: 0.15)
                                    : AppColors.darkText
                                        .withValues(alpha: 0.15),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2.5.w),
                                    topRight: Radius.circular(2.5.w),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      Paths.homeHudlePlaygroundImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w,
                                    vertical: 2.5.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 3.5.w, vertical: 2.5.w),
                                      //   decoration: BoxDecoration(
                                      //     color: AppColors.darkGreenColor,
                                      //     borderRadius: BorderRadius.circular(100.w),
                                      //   ),
                                      //   child: Row(
                                      //     mainAxisSize: MainAxisSize.min,
                                      //     children: [
                                      //       Icon(
                                      //         Icons.sports_football,
                                      //         color: AppColors.lightText,
                                      //         size: 15.sp,
                                      //       ),
                                      //       SizedBox(width: 2.5.w),
                                      //       Text(
                                      //         "Football",
                                      //         style: AppTextStyles.body.copyWith(
                                      //           fontSize: 12.sp,
                                      //           fontWeight: FontWeight.bold,
                                      //           color: Colors.white,
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      SizedBox(height: 2.5.w),
                                      Text(
                                        "Conscient Sports | Vasant Kunj",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.body.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          color: isDarkMode
                                              ? AppColors.lightText
                                              : Color(0xFF020202),
                                        ),
                                      ),
                                      SizedBox(height: 2.5.w),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.pin_drop_sharp,
                                            size: 15.sp,
                                            color: isDarkMode
                                                ? AppColors.lightText
                                                : AppColors.mediumGreyColor,
                                          ),
                                          SizedBox(width: 1.5.w),
                                          Expanded(
                                            child: Text(
                                              "The Heritage School, D-2, Pocket 2, Vasant Kunj, Delhi",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style:
                                                  AppTextStyles.body.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp,
                                                color: isDarkMode
                                                    ? AppColors.lightText
                                                    : AppColors.mediumGreyColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLandingSection(bool isDarkMode) {
    return Container(
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
                opacity: isDarkMode ? 0.4 : 1,
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
                              borderRadius: BorderRadius.circular(2.5.w),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSection(WidgetRef ref, BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/join_a_game');
            },
            child: Container(
              padding: EdgeInsets.all(2.5.w),
              decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SvgPicture.asset(
                      Paths.homeJoinGameImage,
                      color: AppColors.lightText,
                    ),
                  ),
                  Text(
                    "Join a Game",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.lightText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              ref.read(mainControllerProvider.notifier).updateIndex(0);
            },
            child: Container(
              padding: EdgeInsets.all(2.5.w),
              decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SvgPicture.asset(
                      Paths.homeBecomeMemberImage,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Become a Member",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.lightText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
      ],
    );
  }
}
