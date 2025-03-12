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
}
