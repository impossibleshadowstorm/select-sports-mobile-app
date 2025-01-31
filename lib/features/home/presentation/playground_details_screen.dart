import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/providers/theme_provider.dart';
import 'package:select_sports/utils/common_functions.dart';
import 'home_controller.dart';

class PlaygroundDetailsScreen extends ConsumerStatefulWidget {
  final String playgroundId;
  final bool onlyPlayground;

  const PlaygroundDetailsScreen({
    super.key,
    required this.playgroundId,
    this.onlyPlayground = true,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlaygroundDetailsScreenState();
}

class _PlaygroundDetailsScreenState
    extends ConsumerState<PlaygroundDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;
    final homeState = ref.watch(homeControllerProvider);
    final homeController = ref.read(homeControllerProvider.notifier);

    // Example images
    final List<String> playgroundImages = [
      Paths.homeHudlePlaygroundImage,
      Paths.homeHudlePlaygroundImage2,
      Paths.homeHudlePlaygroundImage3,
    ];

    //Example Amenities
    final List<String> venueAmenities = [
      "DRINKING_WATER",
      "WALKING_TRACK",
      "WASHROOM",
      "WARM_UP_AREA",
      "COACHING_AVAILABLE",
      "PARKING"
    ];

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: "Hero0",
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            // transitionBuilder: (child, animation) {
                            //   final offsetAnimation = Tween<Offset>(
                            //     begin: homeController.isSwipeRight
                            //         ? const Offset(1, 0)
                            //         : const Offset(-1, 0),
                            //     end: Offset.zero,
                            //   ).animate(animation);
                            //   return SlideTransition(
                            //     position: offsetAnimation,
                            //     child: child,
                            //   );
                            // },
                            transitionBuilder: (child, animation) {
                              final offsetAnimation = Tween<Offset>(
                                begin: homeController.isSwipeRight
                                    ? const Offset(1, 0)
                                    : const Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(animation);
                              return Stack(
                                children: [
                                  // Keeps the previous image visible during the animation
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(2.5.w),
                                          topRight: Radius.circular(2.5.w),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            playgroundImages[
                                                homeState.previousImage],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // The new image with sliding animation
                                  SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  ),
                                ],
                              );
                            },
                            child: Container(
                              key: ValueKey<int>(homeState.currentImage),
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(2.5.w),
                                  topRight: Radius.circular(2.5.w),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    playgroundImages[homeState.currentImage],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 7.5.h,
                          left: 5.w,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.5.w,
                                vertical: 2.5.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreenColor,
                                borderRadius: BorderRadius.circular(2.5.w),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.darkText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.w),
                    _buildImageScroller(isDarkMode, playgroundImages,
                        homeController, homeState),
                    SizedBox(height: 2.5.w),
                    _buildMainSection(isDarkMode),
                    SizedBox(height: 5.w),
                    _buildDescriptionSection(isDarkMode),
                    SizedBox(height: 5.w),
                    _buildAmenitiesSection(isDarkMode, venueAmenities)
                  ],
                ),
              ),
            ),
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: CustomButtons.fullWidthFilledButton(
                buttonText: "Book Now",
                ref: ref,
                onClick: () {},
                customDarkColor: AppColors.darkGreenColor,
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(bool isDarkMode) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppText.detailHeading("Description", isDarkMode),
          SizedBox(height: 2.5.w),
          Text(
            "CoachDirect Sports in Electronic City is the ultimate destination for sports enthusiasts! Our venue offers a diverse range of sports facilities, including football, badminton, basketball, volleyball, and table tennis. Whether you're a seasoned athlete or just looking for some active fun, our well-maintained courts and fields provide the perfect setting. Join us for thrilling games and friendly competition in the heart of Electronic City. CoachDirect Sports is where the action happens!",
            textAlign: TextAlign.justify,
            style: AppTextStyles.body.copyWith(
              color: isDarkMode
                  ? AppColors.lightGreyColor
                  : AppColors.darkGreyColor,
              fontSize: 14.5.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageScroller(
    bool isDarkMode,
    List<String> playgroundImages,
    HomeController homeController,
    HomeControllerState homeState,
  ) {
    return Container(
      height: 75,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: playgroundImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              homeController.updateCurrentImage(index);
            },
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            child: Container(
              margin: EdgeInsets.only(right: 2.5.w),
              width: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5.w),
                image: DecorationImage(
                  image: NetworkImage(playgroundImages[index]),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                ),
              ),
              child: index == homeState.currentImage
                  ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5.w),
                        color: AppColors.darkText.withValues(alpha: 0.5),
                      ),
                    )
                  : SizedBox(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainSection(bool isDarkMode) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 3.w),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.darkGreenColor
              : AppColors.lightestGreyColorV2,
          borderRadius: BorderRadius.circular(2.5.w),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_city_rounded,
                  color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                  size: 18.sp,
                ),
                SizedBox(width: 1.5.w),
                Expanded(
                  child: Text(
                    "Sports Hub Gurugram | Sector-48",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.subheading.copyWith(
                      color:
                          isDarkMode ? AppColors.lightText : AppColors.darkText,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: isDarkMode
                      ? AppColors.lightGreyColor
                      : AppColors.mediumGreyColor,
                  size: 17.sp,
                ),
                SizedBox(width: 1.5.w),
                Expanded(
                  child: Text(
                    "GD Goenka Public School, Block-A, Vipul World, Sector-48, Gurgaon",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.subheading.copyWith(
                      color: isDarkMode
                          ? AppColors.lightGreyColor
                          : AppColors.mediumGreyColor,
                      fontSize: 14.5.sp,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.near_me_outlined,
                  color: isDarkMode
                      ? AppColors.lightGreyColor
                      : AppColors.mediumGreyColor,
                  size: 17.sp,
                ),
                SizedBox(width: 1.5.w),
                Text(
                  "Nearby: ",
                  maxLines: 2,
                  style: AppTextStyles.subheading.copyWith(
                    color: isDarkMode
                        ? AppColors.lightGreyColor
                        : AppColors.mediumGreyColor,
                    fontSize: 14.5.sp,
                  ),
                ),
                Text(
                  "Sector 48-49 Metro (1.7 KM)",
                  maxLines: 2,
                  style: AppTextStyles.subheading.copyWith(
                    color: isDarkMode
                        ? AppColors.lightGreyColor
                        : AppColors.darkText,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenitiesSection(bool isDarkMode, List<String> venueAmenities) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppText.detailHeading("Amenities", isDarkMode),
          SizedBox(height: 2.5.w),
          SizedBox(
            height: venueAmenities.length * 30, // Adjust Amenities height
            width: 100.w,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 9 / 2,
              children: List.generate(
                venueAmenities.length,
                (index) {
                  return Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/venue/${venueAmenities[index].toLowerCase()}.svg",
                        height: 20,
                        width: 20,
                        color: isDarkMode
                            ? AppColors.lightText
                            : AppColors.darkText,
                      ),
                      SizedBox(width: 2.5.w),
                      Text(
                        CommonFunctions.capitalizeFirst(
                          venueAmenities[index]
                              .replaceAll("_", " ")
                              .toLowerCase(),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14.sp,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkText,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
