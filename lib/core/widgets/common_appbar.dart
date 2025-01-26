import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';

class CommonAppbar {
  static Widget appbarWithoutLeading(BuildContext context, bool isDarkMode, String title) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.subheading.copyWith(
              color: isDarkMode ? AppColors.lightText : AppColors.darkText,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
