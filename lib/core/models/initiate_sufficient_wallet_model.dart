import 'package:select_sports/utils/app_logger.dart';

class InitiateSufficientWalletModel {
  final bool success;
  final String message;
  final String bookingId;
  final String assignedTeam;
  final int status;

  InitiateSufficientWalletModel({
    required this.success,
    required this.message,
    required this.bookingId,
    required this.assignedTeam,
    required this.status,
  });

  factory InitiateSufficientWalletModel.fromJson(Map<String, dynamic> json) {
    try {
      return InitiateSufficientWalletModel(
        success: json['success'],
        message: json['message'],
        bookingId: json['bookingId'],
        assignedTeam: json['assignedTeam'],
        status: json['status'],
      );
    } catch (e, s) {
      logger.e("BookingResponse Model Parsing Failed", error: e, stackTrace: s);
      throw Exception("BookingResponse parsing failed");
    }
  }
}
