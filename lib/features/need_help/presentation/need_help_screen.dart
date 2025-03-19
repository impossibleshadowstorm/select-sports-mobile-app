import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/faqs.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class NeedHelpScreen extends ConsumerStatefulWidget {
  const NeedHelpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NeedHelpScreenState();
}

class _NeedHelpScreenState extends ConsumerState<NeedHelpScreen> {
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
                "Need Help",
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
                        "We’re here to help you with anything and everything on Select Sports",
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
                        "At Select Sports we expect at a day’s start is you, better and happier than yesterday. We have got you covered share your concern or check our frequently asked questions listed below.",
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode
                              ? AppColors.lightGreyColor
                              : AppColors.darkGreyColor,
                        ),
                      ),
                      SizedBox(height: 7.5.w),

                      // FAQ Section
                      Text(
                        "FAQ",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.lightText
                              : AppColors.darkGreenColor,
                        ),
                      ),
                      SizedBox(height: 5.w),

                      for (var i = 0; i < AppFaqs.faqList.length; i++)
                        // FAQ Items
                        faqTile(
                          isDarkMode,
                          AppFaqs.faqList[i]["question"]!,
                          AppFaqs.faqList[i]["answer"]!,
                        ),
                      SizedBox(height: 5.w),

                      // TODO: Enable Send Message Button
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: CustomButtons.fullWidthFilledButton(
                      //     buttonText: "Send a message",
                      //     ref: ref,
                      //     onClick: () {},
                      //     customDarkColor: AppColors.darkGreenColor,
                      //   ),
                      // ),
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

  // FAQ Tile Widget
  Widget faqTile(bool isDarkMode, String title, String content) {
    return Card(
      margin: EdgeInsets.only(bottom: 2.5.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.5.w),
      ),
      elevation: 0.5,
      child: ExpansionTile(
        title: Text(
          title,
          style: AppTextStyles.body.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: isDarkMode
                ? AppColors.lightGreenColor.withValues(alpha: 0.7)
                : AppColors.darkGreenColor,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
            child: Text(
              content,
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                color: isDarkMode
                    ? AppColors.lightGreyColor
                    : AppColors.darkGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
