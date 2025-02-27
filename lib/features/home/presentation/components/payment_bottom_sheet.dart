import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_bottom_sheet.dart';
import 'package:select_sports/features/home/presentation/home_controller.dart';

void paymentBottomSheet(
  BuildContext context,
  bool isDarkMode,
) {
  CommonBottomSheets.customDraggableBottomSheet(
    context,
    (controller) => Consumer(builder: (context, ref, child) {
      return Container(
        height: 75.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5.w),
                width: 60.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: AppColors.darkGreenColor,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              SizedBox(height: 5.w),
              Text(
                "In-App Payment",
                style: AppTextStyles.subheading.copyWith(
                  color: isDarkMode
                      ? AppColors.lightGreenColor
                      : AppColors.darkGreenColor,
                ),
              ),
              Divider(
                color: isDarkMode
                    ? AppColors.darkGreyColor
                    : AppColors.lightestGreyColorV3,
              ),
              SizedBox(height: 5.w),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.5.w),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkGreyColor
                      : AppColors.lightText,
                  borderRadius: BorderRadius.circular(2.5.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildModeTabs(isDarkMode, ref, 0, "Wallet"),
                    _buildModeTabs(isDarkMode, ref, 1, "Card"),
                    _buildModeTabs(isDarkMode, ref, 2, "UPI"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}

Widget _buildModeTabs(
  bool isDarkMode,
  WidgetRef ref,
  int index,
  String title,
) {
  return Consumer(
    builder: (context, ref, child) {
      final selectedPaymentMode = ref.watch(
          homeControllerProvider.select((state) => state.selectedPaymentMode));
      final bool isSelected = selectedPaymentMode == index;

      return Expanded(
        child: InkWell(
          onTap: () => ref
              .read(homeControllerProvider.notifier)
              .updatePaymentMode(index),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.5.w),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.darkGreenColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2.5.w),
            ),
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.body.copyWith(
                  color: isSelected
                      ? AppColors.lightText
                      : (isDarkMode
                          ? AppColors.lightGreyColor
                          : AppColors.darkText),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
