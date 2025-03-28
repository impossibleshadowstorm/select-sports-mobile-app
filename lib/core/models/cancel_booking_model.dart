class BookingCancellation {
  final bool success;
  final String message;
  final double refundAmount;
  final String bookingStatus;

  BookingCancellation({
    required this.success,
    required this.message,
    required this.refundAmount,
    required this.bookingStatus,
  });

  factory BookingCancellation.fromJson(Map<String, dynamic> json) {
    return BookingCancellation(
      success: json['success'],
      message: json['message'],
      refundAmount: json['refundAmount'].toDouble(),
      bookingStatus: json['bookingStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'refundAmount': refundAmount,
      'bookingStatus': bookingStatus,
    };
  }
}
