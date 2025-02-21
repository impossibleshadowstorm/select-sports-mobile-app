import 'package:intl/intl.dart';

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? validatePostalCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Postal code is required";
    }
    final postalCodeRegExp = RegExp(r'^\d{6}$');
    if (!postalCodeRegExp.hasMatch(value)) {
      return "Please enter a valid 6-digit postal code";
    }
    return null;
  }


  static String? validateConfirmPassword(
      String? confirmPassword, String? newPassword) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return "Confirm Password is required";
    }
    if (confirmPassword != newPassword) {
      return "Both Password must be Same";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }

  static String? validateDob(String? value) {
    if (value == null || value.isEmpty) {
      return "Date of Birth is required";
    }

    try {
      DateTime dob = DateFormat("dd-MM-yyyy").parse(value);
      DateTime now = DateTime.now();
      int age = now.year - dob.year;

      if (now.month < dob.month ||
          (now.month == dob.month && now.day < dob.day)) {
        age--;
      }

      if (age < 15) {
        return "You must be at least 15 years old";
      } else if (age > 80) {
        return "Age cannot be more than 80 years";
      }
    } catch (e) {
      return "Invalid date format. Use dd-MM-yyyy";
    }

    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "OTP is required";
    }
    final otpRegex = RegExp(r'^[0-9]{6}$');
    if (!otpRegex.hasMatch(value.trim())) {
      return "Enter a valid 6-digit OTP";
    }
    return null;
  }
}
