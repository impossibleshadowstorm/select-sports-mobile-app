import 'package:select_sports/core/models/address_model.dart';
import 'package:select_sports/utils/app_logger.dart';

class Venue {
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final List<String> images;
  final String description;
  final List<String> amenities;
  final String addressId;
  final Address address;

  Venue({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.description,
    required this.amenities,
    required this.addressId,
    required this.address,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    try {
      return Venue(
        id: json['id'],
        name: json['name'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        images: List<String>.from(json['images'] ?? []),
        description: json['description'],
        amenities: List<String>.from(json['amenities'] ?? []),
        addressId: json['addressId'],
        address: Address.fromJson(json['address']),
      );
    } catch (e, s) {
      logger.e("Venue Model Parsing Failed", error: e, stackTrace: s);
      return throw Exception("Venue parsing failed");
    }
  }
}
