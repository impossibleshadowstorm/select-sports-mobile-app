import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import '../../../providers/theme_provider.dart';

class PlaygroundDetailsScreen extends ConsumerStatefulWidget {
  const PlaygroundDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlaygroundDetailsScreenState();
}

class _PlaygroundDetailsScreenState
    extends ConsumerState<PlaygroundDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "Hero0",
                    child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2.5.w),
                          topRight: Radius.circular(2.5.w),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://media.hudle.in/venues/36ea11a9-8046-4f05-92a7-bc64abc07297/photo/b553c7cf017a41d7db300a1995a70b2798fcd4af',
                          ),
                          fit: BoxFit.cover,
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
            ],
          ),
        ),
      ),
    );
  }
}
