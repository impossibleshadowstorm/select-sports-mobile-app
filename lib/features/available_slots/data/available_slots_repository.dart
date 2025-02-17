import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/features/profile/data/models/profile_options_model.dart';

class AvailableSlotsRepository {
  final ApiClient apiClient;

  AvailableSlotsRepository(this.apiClient);

  Future<List<Slot>> getAvailableSlots() async {
    try {
      final response =
          await apiClient.get(ApiEndpoints.availableSlots);

      if (response.statusCode == 200) {
        List<dynamic> slotsData = response.data['data'];
        return slotsData.map((slot) => Slot.fromJson(slot)).toList();
      }

      return [];
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Available Slots Repository Error:");
        print(e);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<ProfileOptions?> getProfileOptions() async {
    try {
      final response =
          await apiClient.authorizedGet(ApiEndpoints.sportsProfileOptions);

      if (response.statusCode == 200) {
        return ProfileOptions.fromJson(response.data['data']);
      }

      return null;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

final availableSlotsRepositoryProvider = Provider<AvailableSlotsRepository>(
  (ref) => AvailableSlotsRepository(
    ApiClient(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  ),
);
