import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import '../../../providers/theme_provider.dart';
import 'main_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(mainControllerProvider);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;
    final controller = ref.read(mainControllerProvider.notifier);

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            controller.pages[selectedIndex],
            Positioned(
              bottom: 40,
              left: 2.5.w,
              child: Container(
                width: 95.w,
                padding: EdgeInsets.symmetric(vertical: 2.5.w),
                decoration: BoxDecoration(
                  color: AppColors.lightBlack,
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: controller.navItems.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return _buildNavItem(
                        item['icon'], item['label'], index, ref);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    WidgetRef ref,
  ) {
    final isSelected = ref.watch(mainControllerProvider) == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(mainControllerProvider.notifier).updateIndex(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.5.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.lightGreenColor : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isSelected ? AppColors.darkText : Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
