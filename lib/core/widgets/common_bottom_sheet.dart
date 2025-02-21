import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonBottomSheets {
  static void customDraggableBottomSheet(
    BuildContext context,
    Widget Function(ScrollController controller) contentBuilder,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      // isDismissible: false,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          snap: true,
          builder: (_, controller) {
            return contentBuilder(controller);
          },
        );
      },
    );
  }
}
