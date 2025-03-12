import 'package:select_sports/core/models/sport_model.dart';
import 'package:select_sports/core/models/venue_model.dart';
import 'package:select_sports/utils/app_logger.dart';

class Slot {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final int maxPlayer;
  final String slotType;
  final String status;
  final String createdAt;
  final String updatedAt;
  final double price;
  final double discountedPrice;
  final String sportId;
  final String venueId;
  final String? team1Id;
  final String? team2Id;
  final String? hostId;
  final Sport sport;
  final Venue venue;
  final List<Booking> bookings;

  Slot({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.maxPlayer,
    required this.slotType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
    required this.discountedPrice,
    required this.sportId,
    required this.venueId,
    this.team1Id,
    this.team2Id,
    this.hostId,
    required this.sport,
    required this.venue,
    required this.bookings,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    try {
      return Slot(
        id: json['id'] as String,
        startTime: DateTime.parse(json['startTime']),
        endTime: DateTime.parse(json['endTime']),
        maxPlayer: json['maxPlayer'] as int,
        slotType: json['slotType'] as String,
        status: json['status'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        price: json['price'].toDouble(),
        discountedPrice: json['discountedPrice'].toDouble(),
        sportId: json['sportId'] as String,
        venueId: json['venueId'] as String,
        team1Id: json['team1Id'] as String?,
        team2Id: json['team2Id'] as String?,
        hostId: json['hostId'] as String?,
        sport: Sport.fromJson(json['sport']),
        venue: Venue.fromJson(json['venue']),
        bookings: (json['bookings'] as List<dynamic>?)
                ?.map((booking) => Booking.fromJson(booking))
                .toList() ??
            [],
      );
    } catch (e, s) {
      logger.e("Slot Model Parsing Failed", error: e, stackTrace: s);
      return throw Exception("Slot parsing failed");
    }
  }
}

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
    try {
      return Booking(
        id: json['id'],
        status: json['status'],
        cancellationFee: json['cancellationFee'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        slotId: json['slotId'],
        userId: json['userId'],
      );
    } catch(e) {
      return throw Exception("Booking parsing failed");
    }
  }
}

