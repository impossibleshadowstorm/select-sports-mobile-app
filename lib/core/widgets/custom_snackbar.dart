// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class CustomSnackBar {
//   static void showSuccess(String message) {
//     _showToast(message, Colors.green);
//   }
//
//   static void showError(String message) {
//     _showToast(message, Colors.red);
//   }
//
//   static void showWarning(String message) {
//     _showToast(message, Colors.orange);
//   }
//
//   static void _showToast(String message, Color backgroundColor) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: backgroundColor,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomSnackBar {
  static void showSuccess(String message, {String? title}) {
    _showToast(
      title: Text(title ?? 'Success'),
      description: Text(message),
      type: ToastificationType.success,
      primaryColor: Colors.green,
    );
  }

  static void showError(String message, {String? title}) {
    _showToast(
      title: Text(title ?? 'Error'),
      description: Text(message),
      type: ToastificationType.error,
      primaryColor: Colors.red,
    );
  }

  static void showWarning(String message, {String? title}) {
    _showToast(
      title: Text(title ?? 'Warning'),
      description: Text(message),
      type: ToastificationType.warning,
      primaryColor: Colors.orange,
    );
  }

  static void _showToast({
    required Widget title,
    required Widget description,
    required ToastificationType type,
    required Color primaryColor,
  }) {
    toastification.show(
      title: title,
      description: description,
      type: type,
      primaryColor: primaryColor,
      autoCloseDuration: const Duration(seconds: 5),
      style: ToastificationStyle.flat,
      showIcon: true,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
