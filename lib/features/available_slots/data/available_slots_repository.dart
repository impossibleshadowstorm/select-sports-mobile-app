import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/features/profile/data/models/profile_options_model.dart';
import 'package:select_sports/utils/app_logger.dart';

class AvailableSlotsRepository {
  final ApiClient apiClient;

  AvailableSlotsRepository(this.apiClient);

  Future<List<Slot>> getAvailableSlots() async {
    try {
      final response = await apiClient.get(ApiEndpoints.availableSlots);

      if (response.statusCode == 200) {
        List<dynamic> slotsData = response.data['data'];
        try {
          return slotsData.map((slot) => Slot.fromJson(slot)).toList();
        } catch (err, stack) {
          logger.e("Available Slot Repository Dio Exception [Available slots]",
              error: err, stackTrace: stack);
        }
      }

      return [];
    } on DioException catch (err, stack) {
      logger.e("Available Slot Repository Dio Exception [Available slots]",
          error: err, stackTrace: stack);
      return [];
    } catch (err, stack) {
      logger.e("Available Slot Repository Error [Available slots]",
          error: err, stackTrace: stack);
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
    } on DioException catch (err, stack) {
      logger.e("Available Slot Repository Dio Exception [Profile Options]",
          error: err, stackTrace: stack);
      return null;
    } catch (err, stack) {
      logger.e("Available Slot Repository Error [Profile Options]",
          error: err, stackTrace: stack);
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
