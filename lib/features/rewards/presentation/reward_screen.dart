import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/features/rewards/presentation/reward_controller.dart';
import 'package:select_sports/providers/theme_provider.dart';

class RewardScreen extends ConsumerWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coupons = ref.watch(couponProvider);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkScaffoldBackground
          : AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColors.darkScaffoldBackground
            : AppColors.lightBackground,
        elevation: 0,
        title: Text(
          'Your Rewards',
          style: TextStyle(
            color: isDarkMode ? AppColors.lightestGreyColor : Colors.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          child: Icon(
            Icons.arrow_back_sharp,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 75.0.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDarkMode
                          ? [AppColors.darkGreyColor, AppColors.darkGreenColor]
                          : [
                              AppColors.lightGreyColor,
                              AppColors.lightGreenColor
                            ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TabBar(
                          unselectedLabelColor: isDarkMode
                              ? AppColors.lightestGreyColor
                              : Colors.white,
                          labelColor: isDarkMode ? Colors.white : Colors.black,
                          indicatorColor:
                              isDarkMode ? Colors.black : Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: isDarkMode ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tabs: [
                            Tab(
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: Text('Coupons'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: Text('Points'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.darkScaffoldBackground
                        : AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.black.withOpacity(0.3)
                            : Colors.white.withOpacity(0.3),
                        offset: Offset(-4, -4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        iconSize: 30,
                        color: isDarkMode ? Colors.white : AppColors.lightText,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sort),
                        iconSize: 30,
                        color: isDarkMode ? Colors.white : AppColors.lightText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: coupons.isEmpty
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: coupons.length,
                            itemBuilder: (context, index) {
                              final coupon = coupons[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.0.h, horizontal: 5.0.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 18.h,
                                      width: 20.0.w,
                                      decoration: BoxDecoration(
                                        color: isDarkMode
                                            ? AppColors.darkGreenColor
                                            : AppColors.redColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0.5.h),
                                          bottomLeft: Radius.circular(0.5.h),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
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
                                                coupon.code,
                                                style: TextStyle(
                                                  color: AppColors.lightText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ...List.generate(4, (index) {
                                            double topPosition =
                                                (index * 22 + 17) * 18.h / 100 -
                                                    5 * 18.h / 100;
                                            return Positioned(
                                              left: -5,
                                              top: topPosition,
                                              child: Container(
                                                height: 10.0 * 13.h / 100,
                                                width: 10.0 * 13.h / 100,
                                                decoration: BoxDecoration(
                                                  color: isDarkMode
                                                      ? AppColors
                                                          .darkScaffoldBackground
                                                      : AppColors
                                                          .lightBackground,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      blurRadius: 4,
                                                      offset: Offset(1, 2),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
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
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: Offset(2, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                coupon.code,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: isDarkMode
                                                      ? AppColors.lightText
                                                      : Colors.black,
                                                ),
                                              ),
                                              subtitle: Text(
                                                coupon.description,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: isDarkMode
                                                      ? AppColors.lightText
                                                          .withOpacity(0.7)
                                                      : Colors.grey[700],
                                                ),
                                              ),
                                              trailing: Text(
                                                'APPLY',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: isDarkMode
                                                      ? AppColors
                                                          .lightGreenColor
                                                      : AppColors.darkBlue,
                                                ),
                                              ),
                                              onTap: () {
                                                print('${coupon.code} clicked');
                                              },
                                            ),
                                            DottedLine(
                                              direction: Axis.horizontal,
                                              lineThickness: 1.0,
                                              dashColor: isDarkMode
                                                  ? AppColors.lightText
                                                  : Colors.black,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Text(
                                                coupon.offerDetails,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: isDarkMode
                                                      ? AppColors.lightText
                                                      : Colors.black,
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
                            },
                          ),
                  ),
                  const Center(
                    child: Text('Points content will go here'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
