import 'package:flutter/material.dart';

class AppColors {
  /*
  * Light Theme
  * */
  // Backgrounds
  static const lightBackground = Colors.white;
  static const lightGreyBackground = Color(0xFF35393D);
  static const lightGreyColor = Color(0xFFCACACA);
  static const mediumGreyColor = Color(0xFF6C7278);
  static const darkGreyColor = Color(0xFF35393D);
  static const lightestGreyColor = Color(0xFFFAFAFA);
  static const lightestGreyColorV2 = Color(0xFFF5F5F5);
  static const lightestGreyColorV3 = Color(0xFFE5E5E5);

  static const cardColor = Color.fromARGB(0, 2, 71, 219);
  static const redColor = Colors.red;
  static const darkBlue = Colors.blueGrey;

  // Texts
  static const lightText = Colors.white;

  /*
  * Dark Theme
  * */
  // Backgrounds
  static const darkestBackground = Color(0xFF0D1C2C);
  static const darkestBackgroundV2 = Color(0xFF1D1D1D);
  static const darkMediumBackground = Color(0xFF162534);
  static const darkLightBackground = Color(0xFF1F2E3B);

  static const lightBlack = Color(0xFF0C0D10);
  static const oppositeLightBlack = Color(0xFF33383E);

  static const darkScaffoldBackground = Color(0xFF171717);
  static const inputFilledBackground = Color(0xFF35393D);

  // original light green static const lightGreenColor = Color(0xFFC0E863);
  static const lightGreenColor = Color(0xFF19C965);
  static const mediumGreenColor = Color(0xFF19C965);

  // static const darkGreenColor = Color(0xFF4F6A29);
  static const darkGreenColor = Color(0xFF17633A);

  // Texts
  static const darkText = Colors.black;
}

class AppCommonTexts {
  static const String rupeeIcon = "₹";
}

class AppTextStyles {
  static const largeHeading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const subheading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
}
