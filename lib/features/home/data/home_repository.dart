import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/core/models/venue_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/features/profile/data/models/profile_options_model.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository(this.apiClient);

  Future<List<Venue>> getVenues() async {
    try {
      final response = await apiClient.get(ApiEndpoints.venues);

      if (response.statusCode == 200) {
        List<dynamic> venuesData = response.data['data'];
        return venuesData.map((venue) => Venue.fromJson(venue)).toList();
      }

      return [];
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Home Repository Error:");
        print(e);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<Venue?> getVenueDetail(String id) async {
    try {
      final response = await apiClient.get("${ApiEndpoints.venues}/$id");

      if (response.statusCode == 200) {
        var venueData = response.data['data'];
        return Venue.fromJson(venueData);
      }

      return null;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Home Repository Error [Get Venue]:");
        print(e);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Slot?> getSlotDetail(String id) async {
    try {
      final response = await apiClient.get("${ApiEndpoints.availableSlots}/$id");

      if (response.statusCode == 200) {
        var slotData = response.data['data'];
        return Slot.fromJson(slotData);
      }

      return null;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Home Repository Error [Get Slot]:");
        print(e);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepository(
    ApiClient(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  ),
);
