class Booking {
  final String id;
  final String status;
  final String? cancellationFee;
  final String createdAt;
  final String updatedAt;
  final String slotId;
  final String userId;

  Booking({
    required this.id,
    required this.status,
    this.cancellationFee,
    required this.createdAt,
    required this.updatedAt,
    required this.slotId,
    required this.userId,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      status: json['status'],
      cancellationFee: json['cancellationFee'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slotId: json['slotId'],
      userId: json['userId'],
    );
  }
}
