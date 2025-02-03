import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class UpcomingBookingsScreen extends ConsumerStatefulWidget {
  const UpcomingBookingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpcomingBookingsScreenState();
}

class _UpcomingBookingsScreenState extends ConsumerState<UpcomingBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme mode is dark
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
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
                "Upcoming Bookings",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
