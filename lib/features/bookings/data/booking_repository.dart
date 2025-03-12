import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/booking_list_model.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/features/profile/data/models/profile_options_model.dart';
import 'package:select_sports/utils/app_logger.dart';

class BookingRepository {
  final ApiClient apiClient;

  BookingRepository(this.apiClient);

  Future<List<BookingList>> getBookings() async {
    try {
      final response = await apiClient.authorizedGet(ApiEndpoints.bookings);

      if (response.statusCode == 200) {
        List<dynamic> bookingsData = response.data['data'];
        try {
          return bookingsData.map((booking) => BookingList.fromJson(booking)).toList();
        } catch (err, stack) {
          logger.e("Booking Repository Dio Exception [Get Bookings]",
              error: err, stackTrace: stack);
        }
      }

      return [];
    } on DioException catch (err, stack) {
      logger.e("Booking Repository Dio Exception [Get Bookings]",
          error: err, stackTrace: stack);
      return [];
    } catch (err, stack) {
      logger.e("Booking Repository Error [Get Bookings]",
          error: err, stackTrace: stack);
      return [];
    }
  }
}

final bookingRepositoryProvider = Provider<BookingRepository>(
  (ref) => BookingRepository(
    ApiClient(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  ),
);
