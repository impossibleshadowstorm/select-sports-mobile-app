import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class TermsAndConditionsScreen extends ConsumerStatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState
    extends ConsumerState<TermsAndConditionsScreen> {
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
                "Terms & Conditions",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 2.5.w),
                    _buildHeadingTagline(isDarkMode),
                    SizedBox(height: 5.w),
                    _buildIntroduction(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildGeneralTerms(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildBookingAndCancellationPolicy(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildCodeOfConduct(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildFacilityUsage(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildSafelyAndLiability(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildPrivacyPolicy(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildAmendmentsToTerm(isDarkMode),
                    SizedBox(height: 10.w),
                    _buildContactUs(isDarkMode),
                    SizedBox(height: 10.w),
                    Text(
                      "🏆 Select Sports – Play, Compete, Repeat! ⚽",
                      textAlign: TextAlign.start,
                      style: AppTextStyles.heading.copyWith(
                        color: isDarkMode
                            ? AppColors.lightGreenColor
                            : AppColors.darkText,
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
      "Terms and Conditions - Select Sports",
      textAlign: TextAlign.start,
      style: AppTextStyles.heading.copyWith(
        color: isDarkMode ? AppColors.lightText : AppColors.darkText,
        fontSize: 17.sp,
      ),
    );
  }

  Widget _buildContactUs(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "9. contact Us"),
        SizedBox(height: 2.5.w),
        Text(
          "For any questions or concerns regarding these Terms and Conditions, please reach out to us at:",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.5.w),
        Text(
          "📧 Email: support@selectsports.com",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.5.w),
        Text(
          "📞 Phone: +91 XXXXXXXXXX",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.5.w),
        Text(
          "🌐 Website: http://selectsports.in",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 7.5.w),
        Text(
          "By using Select Sports services, you agree to these Terms and Conditions. Happy playing! ⚽🏆",
          textAlign: TextAlign.start,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode
                ? AppColors.lightGreyColor
                : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildAmendmentsToTerm(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "8. Amendments to Terms"),
        SizedBox(height: 2.5.w),
        Text(
          "> Select Sports reserves the right to update these Terms and Conditions at any time.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Users will be notified of any major changes through our website or mobile app.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacyPolicy(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "7. Privacy Policy"),
        SizedBox(height: 2.5.w),
        Text(
          "> Select Sports collects and stores personal data for booking purposes only.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> We do not share user data with third parties without consent.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Users can request data deletion at any time by contacting our support team.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildSafelyAndLiability(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "6. Safety & Liability"),
        SizedBox(height: 2.5.w),
        Text(
          "> Players acknowledge that participating in sports activities involves a risk of injury.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Select Sports is not liable for any injuries, accidents, or health issues arising during gameplay.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> It is recommended that players wear proper sports gear and follow safety guidelines.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildFacilityUsage(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "5. Facility Usage"),
        SizedBox(height: 2.5.w),
        Text(
          "> Players must use the facilities responsibly and adhere to the rules and guidelines set by Select Sports.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Any damage to the property or equipment due to negligence will be charged to the responsible individual/team.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Select Sports is not responsible for lost or stolen belongings.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeOfConduct(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "4. Code of Conduct"),
        SizedBox(height: 2.5.w),
        Text(
          "> Players must respect fellow participants, staff, and spectators.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Any form of abusive language, violence, or misconduct will result in an immediate ban from Select Sports facilities.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Alcohol, drugs, and smoking are strictly prohibited within the premises.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildBookingAndCancellationPolicy(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "3. Booking & Cancellation Policy"),
        SizedBox(height: 2.5.w),
        Row(
          children: [
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 16.sp,
            ),
            SizedBox(width: 2.5.w),
            Text(
              "Booking Process:",
              textAlign: TextAlign.justify,
              style: AppTextStyles.heading.copyWith(
                color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.5.w, bottom: 1.5.w, top: 1.5.w),
          child: Text(
            "> Users can book football slots via the Select Sports Mobile App or website.",
            textAlign: TextAlign.justify,
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.5.w, bottom: 1.5.w, top: 1.5.w),
          child: Text(
            "> Payment must be made at the time of booking to confirm the slot.",
            textAlign: TextAlign.justify,
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 16.sp,
            ),
            SizedBox(width: 2.5.w),
            Text(
              "Cancellation & Refund:",
              textAlign: TextAlign.justify,
              style: AppTextStyles.heading.copyWith(
                color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.5.w, bottom: 1.5.w, top: 1.5.w),
          child: Text(
            "> Cancellations made 24 hours prior to the booking time are eligible for a full refund.",
            textAlign: TextAlign.justify,
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.5.w, bottom: 1.5.w, top: 1.5.w),
          child: Text(
            "> Cancellations made less than 24 hours before the game are non-refundable.",
            textAlign: TextAlign.justify,
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 16.sp,
            ),
            SizedBox(width: 2.5.w),
            Text(
              "Late Arrivals & No-Shows:",
              textAlign: TextAlign.justify,
              style: AppTextStyles.heading.copyWith(
                color: isDarkMode ? AppColors.lightText : AppColors.darkText,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.5.w, bottom: 1.5.w, top: 1.5.w),
          child: Text(
            "> Booked slots will be held for 15 minutes from the scheduled time.",
            textAlign: TextAlign.justify,
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.5.w, bottom: 1.5.w, top: 1.5.w),
          child: Text(
            "> If a player or team does not show up within this period, the booking will be canceled without a refund.",
            textAlign: TextAlign.justify,
            style: AppTextStyles.heading.copyWith(
              color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGeneralTerms(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "2. General Terms"),
        SizedBox(height: 2.5.w),
        Text(
          "> Eligibility: Users must be at least 18 years old to book slots. Minors can participate under the supervision of a legal guardian.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Account Registration: Users must provide accurate information when registering on our mobile app.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Fair Play: Players must adhere to fair play and maintain sportsmanship during matches.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
        Text(
          "> Right to Refuse Service: Select Sports reserves the right to refuse access to users violating these terms.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildIntroduction(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(isDarkMode, "1. Introduction"),
        SizedBox(height: 2.5.w),
        Text(
          "Welcome to Select Sports! By accessing our services, including our website, mobile app, and football playgrounds, you agree to abide by the following Terms and Conditions. Please read them carefully before making a booking or using our facilities.",
          textAlign: TextAlign.justify,
          style: AppTextStyles.heading.copyWith(
            color: isDarkMode ? AppColors.lightGreyColor : AppColors.darkText,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildHeading(bool isDarkMode, String title) {
    return Text(
      title,
      style: AppTextStyles.heading.copyWith(
        color: isDarkMode ? AppColors.lightText : AppColors.darkText,
        fontSize: 18.sp,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
