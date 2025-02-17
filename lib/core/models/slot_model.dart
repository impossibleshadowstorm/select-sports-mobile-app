import 'package:select_sports/core/models/sport_model.dart';
import 'package:select_sports/core/models/venue_model.dart';
import 'package:select_sports/core/models/booking_model.dart';

class Slot {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final int maxPlayer;
  final String slotType;
  final String status;
  final String createdAt;
  final String updatedAt;
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
    return Slot(
      id: json['id'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      maxPlayer: json['maxPlayer'],
      slotType: json['slotType'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      sportId: json['sportId'],
      venueId: json['venueId'],
      team1Id: json['team1Id'],
      team2Id: json['team2Id'],
      hostId: json['hostId'],
      sport: Sport.fromJson(json['sport']),
      venue: Venue.fromJson(json['venue']),
      bookings: (json['bookings'] as List)
          .map((booking) => Booking.fromJson(booking))
          .toList(),
    );
  }
}
