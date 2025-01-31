import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class AboutUsScreen extends ConsumerStatefulWidget {
  const AboutUsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends ConsumerState<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                "About Us",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 2.5.w),
                    _buildHeadingTagline(isDarkMode),
                    SizedBox(height: 5.w),
                    _buildAboutDescription(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildOurPresence(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildOurMission(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildMobileApp(isDarkMode),
                    SizedBox(height: 10.w),
                    Text(
                      "🏆 Select Sports – Play, Compete, Repeat! ⚽",
                      textAlign: TextAlign.start,
                      style: AppTextStyles.heading.copyWith(
                        color: isDarkMode
                            ? AppColors.lightGreenColor
                            : AppColors.darkGreenColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadingTagline(bool isDarkMode) {
    return Text(
      "Welcome to Select Sports – Where Passion Meets the Game! 🏆",
      textAlign: TextAlign.start,
      style: AppTextStyles.heading.copyWith(
        color: isDarkMode ? AppColors.lightText : AppColors.darkText,
        fontSize: 17.sp,
      ),
    );
  }

  Widget _buildOurPresence(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "🌍 Our Presence – Bringing Football to Your City",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkText,
            fontSize: 17.sp,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          "Currently, we serve three key locations:",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.5.w),
        Row(
          children: [
            Icon(
              Icons.check_box,
              color: isDarkMode
                  ? AppColors.lightGreenColor
                  : AppColors.darkGreenColor,
            ),
            SizedBox(width: 2.5.w),
            Text(
              "Delhi",
              style: AppTextStyles.heading.copyWith(
                color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.w),
        Row(
          children: [
            Icon(
              Icons.check_box,
              color: isDarkMode
                  ? AppColors.lightGreenColor
                  : AppColors.darkGreenColor,
            ),
            SizedBox(width: 2.5.w),
            Text(
              "Delhi NCR",
              style: AppTextStyles.heading.copyWith(
                color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.w),
        Row(
          children: [
            Icon(
              Icons.check_box,
              color: isDarkMode
                  ? AppColors.lightGreenColor
                  : AppColors.darkGreenColor,
            ),
            SizedBox(width: 2.5.w),
            Text(
              "Gurgaon",
              style: AppTextStyles.heading.copyWith(
                color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.5.w),
        Text(
          "With multiple playgrounds available across these areas, we ensure easy access to quality football facilities. No matter where you are, you’re never too far from a thrilling match with Select Sports!",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildOurMission(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "⚡ Our Mission – Elevating the Football Experience",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkText,
            fontSize: 17.sp,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          "At Select Sports, our mission is to provide:",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.5.w),
        Text(
          "🎯 State-of-the-Art Playgrounds",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "Well-maintained, high-quality football turfs that meet international standards.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 1.5.w),
        Text(
          "🎯 Seamless Booking Experience",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "Our upcoming mobile app will allow users to check match slots, book playgrounds, and enjoy playing without hassle.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 1.5.w),
        Text(
          "🎯 Community & Growth",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "We aim to build a vibrant football community where players can connect, compete, and improve their skills.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 2.5.w),
      ],
    );
  }

  Widget _buildMobileApp(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "📲 Mobile App – Book & Play with Ease",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkText,
            fontSize: 17.sp,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          "We are excited to introduce our upcoming Select Sports Mobile App, designed to make your football experience even smoother!",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.5.w),
        Text(
          "🚀 Find Nearby Playgrounds",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "Locate and explore football grounds in your preferred location.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 1.5.w),
        Text(
          "🚀 Check Match Slots",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "See real-time availability of match slots.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 1.5.w),
        Text(
          "🚀 Instant Booking ",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "Secure your game time in just a few clicks.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 1.5.w),
        Text(
          "🚀 Community & Events",
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightText : AppColors.darkGreyColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "Stay updated on tournaments, leagues, and football events.",
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(height: 2.5.w),
        Text(
          "Stay tuned for the app launch and get ready to take your football experience to the next level! 📱⚽",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutDescription(bool isDarkMode) {
    return Text(
      "At Select Sports, we believe that sports bring people together, create unforgettable moments, and build a strong sense of community. We are more than just a football club – we are a thriving sports community that provides premium football playgrounds for players of all skill levels. Whether you're a casual player or a competitive footballer, we have the perfect space for you to enjoy the game you love.",
      textAlign: TextAlign.justify,
      style: AppTextStyles.heading.copyWith(
        color: isDarkMode ? AppColors.lightGreyColor : AppColors.mediumGreyColor,
        fontSize: 15.sp,
      ),
    );
  }
}
