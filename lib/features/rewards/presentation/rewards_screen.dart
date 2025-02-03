import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/features/rewards/presentation/rewards_controller.dart';
import 'package:select_sports/features/rewards/repository/reward_model.dart';
import 'package:select_sports/providers/theme_provider.dart';

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coupons = ref.watch(couponProvider);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            VisibilityWidgets.statusBarVisibleWidget(context: context),
            CommonAppbar.appbarWithoutLeading(
              context,
              isDarkMode,
              "Coupons & Rewards",
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      width: 75.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          TabBar(
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent),
                            unselectedLabelColor: isDarkMode
                                ? AppColors.lightestGreyColor
                                : AppColors.mediumGreyColor,
                            labelColor: isDarkMode
                                ? AppColors.lightGreenColor
                                : AppColors.darkGreenColor,
                            indicatorColor: isDarkMode
                                ? AppColors.lightGreenColor
                                : AppColors.darkGreenColor,
                            tabs: [
                              Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.w,
                                  ),
                                  child: Text('Coupons'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.w,
                                  ),
                                  child: Text('Points'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Center(
                            child: coupons.isEmpty
                                ? Center(
                                    child: Text(
                                      'No Coupons are Available for now!',
                                      style: AppTextStyles.body.copyWith(
                                        color: isDarkMode
                                            ? AppColors.lightText
                                            : AppColors.darkText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: coupons.length,
                                    padding: EdgeInsets.only(top: 2.5.w),
                                    itemBuilder: (context, index) {
                                      final coupon = coupons[index];
                                      return _buildCouponTile(
                                        isDarkMode,
                                        coupon,
                                      );
                                    },
                                  ),
                          ),
                          Center(
                            child: Text(
                              'No Points Available for now!',
                              style: AppTextStyles.body.copyWith(
                                color: isDarkMode
                                    ? AppColors.lightText
                                    : AppColors.darkText,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponTile(bool isDarkMode, Coupon coupon) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1.0.h,
      ),
      child: Row(
        children: [
          Container(
            height: 18.h,
            width: 20.0.w,
            decoration: BoxDecoration(
              color: AppColors.darkGreenColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.5.h),
                bottomLeft: Radius.circular(0.5.h),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Transform.rotate(
                  angle: -1.570795,
                  child: Center(
                    child: Text(
                      coupon.code.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.lightText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                  4,
                  (index) {
                    double topPosition =
                        (index * 22 + 17) * 18.h / 100 - 5 * 18.h / 100;
                    return Positioned(
                      left: -5,
                      top: topPosition,
                      child: Container(
                        height: 10.0 * 13.h / 100,
                        width: 10.0 * 13.h / 100,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.darkScaffoldBackground
                              : AppColors.lightBackground,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 18.0.h,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.darkMediumBackground
                    : AppColors.lightestGreyColorV2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.5.h),
                  bottomRight: Radius.circular(0.5.h),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    subtitle: Text(
                      coupon.description,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 13.5.sp,
                        color: isDarkMode
                            ? AppColors.lightGreyColor
                            : AppColors.darkGreyColor,
                      ),
                    ),
                    trailing: Text(
                      'APPLY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: isDarkMode
                            ? AppColors.lightGreenColor
                            : AppColors.darkGreenColor,
                      ),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 3.5.w),
                  DottedLine(
                    direction: Axis.horizontal,
                    lineThickness: 1.0,
                    dashColor: isDarkMode
                        ? AppColors.mediumGreyColor
                        : AppColors.mediumGreyColor,
                  ),
                  SizedBox(height: 3.5.w),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      coupon.offerDetails,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 13.sp,
                        color: isDarkMode
                            ? AppColors.lightText
                            : AppColors.darkText,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
