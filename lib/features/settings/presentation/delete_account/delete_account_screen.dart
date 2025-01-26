import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/widgets/common_appbar.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/providers/theme_provider.dart';

class DeleteAccountScreen extends ConsumerStatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends ConsumerState<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              VisibilityWidgets.statusBarVisibleWidget(context: context),
              CommonAppbar.appbarWithoutLeading(
                context,
                isDarkMode,
                "Delete Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
