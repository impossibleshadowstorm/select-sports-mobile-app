import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:select_sports/providers/theme_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            VisibilityWidgets.statusBarVisibleWidget(context: context),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDarkMode
                            ? AppColors.darkGreyColor
                            : AppColors.lightGreyColor,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        height: 37.5.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.darkGreyColor
                                : AppColors.lightGreyColor,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: 31.h,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? AppColors.darkText
                                  : AppColors.lightGreyColor,
                              shape: BoxShape.circle,
                            ),
                            child: SfRadialGauge(
                              axes: [
                                RadialAxis(
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 270,
                                  endAngle: 630,
                                  radiusFactor: 0.7,
                                  canScaleToFit: true,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.1,
                                    color: AppColors.darkGreyColor,
                                    thicknessUnit: GaugeSizeUnit.factor,
                                    cornerStyle: CornerStyle.startCurve,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: 75,
                                      width: 0.1,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      color: AppColors.lightText,
                                      cornerStyle: CornerStyle.bothCurve,
                                    ),
                                    RangePointer(
                                      value: 52,
                                      width: 0.1,
                                      color: AppColors.darkGreyColor,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      cornerStyle: CornerStyle.bothCurve,
                                    ),
                                    RangePointer(
                                      value: 50,
                                      width: 0.1,
                                      color: AppColors.mediumGreenColor,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      cornerStyle: CornerStyle.bothCurve,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16.5.h,
                    left: 10.5.h,
                    child: Container(
                      height: 17.h,
                      width: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            Paths.profileImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                            SizedBox(height: 5.w),
                            Column(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                  ),
                                ),
                                Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                  ),
                                ),
                                VisibilityWidgets.bottomNavBarVisibleWidget(
                                    height: 140),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2.5.w,
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
                          color: AppColors.mediumGreenColor,
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
            )
          ],
        ),
      ),
    );
  }
}
