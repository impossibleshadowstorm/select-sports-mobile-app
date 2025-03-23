import 'dart:ui';

import 'package:intl/intl.dart';

class CommonFunctions {
  static String capitalizeFirst(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1).toLowerCase();
  }

  static String formatDateInDayDateMon(DateTime dateTime) {
    return DateFormat('E d MMM').format(dateTime);
  }

  static String formatTimeIn24HourMinAMPM(DateTime dateTime) {
    return DateFormat('hh:mma').format(dateTime);
  }

  static String getLastNChars(String input, int length) {
    return input.length > length ? input.substring(input.length - length) : input;
  }

  // function to format date like "January 14 2025"
  static String formatDateInMonthDayYear(DateTime dateTime) {
    return DateFormat('MMMM d y').format(dateTime);
  }

  // function to format time like "01:25 PM/AM"
  static String formatTimeIn12HourAMPM(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  // Convert HEX string (#a31f1f) to Flutter Color
  static Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Add alpha if not provided
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
