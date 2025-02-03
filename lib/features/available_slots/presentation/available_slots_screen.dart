import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/features/home/presentation/playground_details_screen.dart';
import 'package:select_sports/providers/theme_provider.dart';

class AvailableSlotsScreen extends ConsumerStatefulWidget {
  const AvailableSlotsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AvailableSlotsScreenState();
}

class _AvailableSlotsScreenState extends ConsumerState<AvailableSlotsScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkScaffoldBackground
          : AppColors.lightestGreyColorV2,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            VisibilityWidgets.statusBarVisibleWidget(context: context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CommonAppbar.appbarWithoutLeading(
                context,
                isDarkMode,
                "Available Games slot",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlaygroundDetailsScreen(
                                  playgroundId: index.toString(),
                                ),
                              ),
                            );
                          },
                          child: _buildSlotSection(
                            isDarkMode: isDarkMode,
                            venueName: 'Conscient Sport',
                            venueLocation:
                                '163 Yulara Dr, Yulara NT 0872, Australia',
                            gameDate: 'Sun 26 Jan',
                            gameTime: '17:00PM',
                            actualPrice: 399.00,
                            discountedPrice: 329.00,
                            onClick: () {
                              // TODO: Open Playground details screen
                            },
                          ),
                        ),
                        SizedBox(height: 5.w),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotSection({
    required bool isDarkMode,
    required String venueName,
    required String venueLocation,
    double venueRating = 3.78,
    int venueRaters = 96,
    required String gameDate,
    required String gameTime,
    required double actualPrice,
    required double discountedPrice,
    required Function onClick,
  }) {
    return Container(
      height: 400,
      width: 100.w,
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: isDarkMode
            ? AppColors.darkestBackgroundV2
            : AppColors.lightBackground,
        boxShadow: [
          isDarkMode
              ? BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: Offset(
                    0,
                    4,
                  ),
                )
              : BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 7,
                  spreadRadius: -3,
                  offset: Offset(
                    0,
                    3,
                  ),
                ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              image: DecorationImage(
                image: NetworkImage(
                  Paths.homeHudlePlaygroundImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.w),
                // Name and Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              gameDate,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : AppColors.darkText,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Container(
                              height: 20,
                              width: 1.5,
                              color: AppColors.lightGreyColor,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              gameTime,
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : AppColors.darkText,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          venueName,
                          style: AppTextStyles.body.copyWith(
                            color: isDarkMode
                                ? AppColors.lightText
                                : AppColors.mediumGreyColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${CommonAppText.rupeeIcon} ${discountedPrice.toString()}",
                          style: AppTextStyles.body.copyWith(
                            color: isDarkMode
                                ? AppColors.lightText
                                : AppColors.darkText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "${CommonAppText.rupeeIcon} ${actualPrice.toString()}",
                          style: AppTextStyles.body.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: isDarkMode
                                ? AppColors.lightText
                                : AppColors.darkText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // Text(
                //   venueLocation,
                //   style: AppTextStyles.body.copyWith(
                //     color: isDarkMode
                //         ? AppColors.lightText
                //         : AppColors.mediumGreyColor,
                //   ),
                // ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    _buildChips(
                      isDarkMode,
                      Paths.homeFootballPlayerIcon,
                      "16 Max Player",
                    ),
                    SizedBox(width: 2.5.w),
                    _buildChips(
                      isDarkMode,
                      Paths.homeFootballPlayerIcon,
                      "6 Slots left",
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChips(bool isDarkMode, String icon, String action) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.w),
      // width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: isDarkMode ? AppColors.darkGreyColor : AppColors.darkGreenColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 15,
              width: 15,
            ),
            SizedBox(width: 2.5.w),
            Text(
              action,
              style: AppTextStyles.body.copyWith(
                color: AppColors.lightText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOldSlotSection({
    required bool isDarkMode,
    required String venueName,
    required String venueLocation,
    double venueRating = 3.78,
    int venueRaters = 96,
    required String gameDate,
    required String gameTime,
    required double actualPrice,
    required double discountedPrice,
    required Function onClick,
  }) {
    return Container(
      width: 100.w,
      height: 350,
      decoration: BoxDecoration(
        color:
            isDarkMode ? AppColors.darkScaffoldBackground : Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(2.5.w),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? AppColors.lightGreenColor.withValues(alpha: 0.15)
                : AppColors.darkText.withValues(alpha: 0.15),
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
                      color:
                          isDarkMode ? AppColors.lightText : Color(0xFF020202),
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
                      color:
                          isDarkMode ? AppColors.lightText : AppColors.darkText,
                    ),
                  ),
                  Text(
                    "Time: $gameTime",
                    style: AppTextStyles.body.copyWith(
                      fontSize: 13.sp,
                      color:
                          isDarkMode ? AppColors.lightText : AppColors.darkText,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "₹$actualPrice",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        onPressed: () => onClick(),
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
  }
}
