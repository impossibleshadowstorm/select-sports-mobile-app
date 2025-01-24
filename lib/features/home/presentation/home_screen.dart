import 'dart:ffi';

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
              _buildActionsSection(ref),
              SizedBox(height: 10.w),
              // Our Playgrounds Section
              _buildPlaygroundsSection(isDarkMode),
              SizedBox(height: 10.w),
              // Upcoming Games Section
              _buildUpcomingGamesSection(
                  isDarkMode: isDarkMode,
                  venueName: 'Conscient Sport',
                  venueLocation: 'Vasant kunj',
                  gameDate: '26-01-2025',
                  gameTime: '17:00',
                  actualPrice: 399.00,
                  discountedPrice: 329.00,
                  onBookNowClick: () {
                    print('Button Clicked');
                  }),
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
                                      'https://media.hudle.in/venues/36ea11a9-8046-4f05-92a7-bc64abc07297/photo/b553c7cf017a41d7db300a1995a70b2798fcd4af',
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

  Widget _buildUpcomingGamesSection({
    required bool isDarkMode,
    required String venueName,
    required String venueLocation,
    double venueRating = 3.78,
    int venueRaters = 96,
    required String gameDate,
    required String gameTime,
    required double actualPrice,
    required double discountedPrice,

    required Function onBookNowClick,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Our Upcoming Games",
            style: AppTextStyles.subheading.copyWith(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
            ),
          ),
          SizedBox(height: 2.5.w),
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 5.w),
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.darkScaffoldBackground
                        : Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(2.5.w),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? AppColors.lightGreenColor.withOpacity(0.15)
                            : AppColors.darkText.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.5.w),
                            topRight: Radius.circular(2.5.w),
                          ),
                          child: Image.network(
                            'https://media.hudle.in/venues/36ea11a9-8046-4f05-92a7-bc64abc07297/photo/b553c7cf017a41d7db300a1995a70b2798fcd4af',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Center(child: Icon(Icons.broken_image));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.5.w,
                            vertical: 2.5.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                venueName,
                                style: AppTextStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: isDarkMode
                                      ? AppColors.lightText
                                      : Color(0xFF020202),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                venueLocation,
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 13.sp,
                                  color: isDarkMode
                                      ? AppColors.lightText
                                      : AppColors.mediumGreyColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Date: $gameDate",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 13.sp,
                                  color: isDarkMode
                                      ? AppColors.lightText
                                      : AppColors.darkText,
                                ),
                              ),
                              Text(
                                "Time: $gameTime",
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 13.sp,
                                  color: isDarkMode
                                      ? AppColors.lightText
                                      : AppColors.darkText,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "\₹$actualPrice",
                                    style: AppTextStyles.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "\₹$discountedPrice",
                                    style: AppTextStyles.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15.sp,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        venueRating.toString(),
                                        style: AppTextStyles.body.copyWith(
                                          fontSize: 13.sp,
                                          color: isDarkMode
                                              ? AppColors.lightText
                                              : AppColors.darkText,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "($venueRaters)",
                                        style: AppTextStyles.body.copyWith(
                                          fontSize: 13.sp,
                                          color: isDarkMode
                                              ? AppColors.lightText
                                              : AppColors.mediumGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () => onBookNowClick(),
                                    child: Text(
                                      "Book Now",
                                      style: AppTextStyles.body.copyWith(
                                        fontSize: 13.sp,
                                        color: AppColors.darkGreenColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
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

  Widget _buildActionsSection(WidgetRef ref) {
    return Row(
      children: [
        SizedBox(width: 5.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // TODO: Pass to Join a Game Screen
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
