import 'package:select_sports/core/models/sport_model.dart';
import 'package:select_sports/core/models/venue_model.dart';

class BookingList {
  final String id;
  final String status;
  final String? cancellationFee;
  final String createdAt;
  final String updatedAt;
  final String slotId;
  final String userId;
  final String transactionId;
  final Slot slot;

  BookingList({
    required this.id,
    required this.status,
    this.cancellationFee,
    required this.createdAt,
    required this.updatedAt,
    required this.slotId,
    required this.userId,
    required this.transactionId,
    required this.slot,
  });

  factory BookingList.fromJson(Map<String, dynamic> json) {
    return BookingList(
      id: json['id'],
      status: json['status'],
      cancellationFee: json['cancellationFee'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slotId: json['slotId'],
      userId: json['userId'],
      transactionId: json['transactionId'],
      slot: Slot.fromJson(json['slot']),
    );
  }
}

class Slot {
  final DateTime startTime;
  final DateTime endTime;
  final int price;
  final int discountedPrice;
  final Sport sport;
  final Venue venue;

  Slot({
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.discountedPrice,
    required this.sport,
    required this.venue,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      price: json['price'],
      discountedPrice: json['discountedPrice'],
      sport: Sport.fromJson(json['sport']),
      venue: Venue.fromJson(json['venue']),
    );
  }
}
