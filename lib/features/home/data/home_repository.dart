import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:select_sports/core/models/initiate_razorpay_model.dart';
import 'package:select_sports/core/models/initiate_sufficient_wallet_model.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/core/models/venue_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/features/profile/data/models/profile_options_model.dart';
import 'package:select_sports/utils/app_logger.dart';

import '../../../core/models/cancel_booking_model.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository(this.apiClient);

  Future<List<Venue>> getVenues() async {
    try {
      final response = await apiClient.get(ApiEndpoints.venues);

      if (response.statusCode == 200) {
        List<dynamic> venuesData = response.data['data'];
        try {
          return venuesData.map((venue) => Venue.fromJson(venue)).toList();
        } catch (e) {
          logger.e("Home Repository Error [Get Venues]", error: e);
        }
      }

      return [];
    } on DioException catch (e, s) {
      logger.e("Home Repository Dio Exception [Get Venues]",
          error: e, stackTrace: s);
      return [];
    } catch (e, s) {
      logger.e("Home Repository Error [Get Venues]", error: e, stackTrace: s);
      return [];
    }
  }

  Future<Venue?> getVenueDetail(String id) async {
    try {
      final response = await apiClient.get("${ApiEndpoints.venues}/$id");

      if (response.statusCode == 200) {
        var venueData = response.data['data'];
        try {
          return Venue.fromJson(venueData);
        } catch (e) {
          logger.e("Home Repository Error [Get Venue Detail]", error: e);
        }
      }

      return null;
    } on DioException catch (e, s) {
      logger.e("Home Repository Dio Exception [Get Venue Detail]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
      logger.e("Home Repository Error [Get Venue Detail]",
          error: e, stackTrace: s);
      return null;
    }
  }

   Future<BookingCancellation?> cancelBooking(String id) async {
    try {
      final response =
          await apiClient.get("${ApiEndpoints.bookings}/$id");

      print(response.statusCode);
      if (response.statusCode == 200) {
        print('data');
        var cancelData = response.data['data'];
        try {
          return BookingCancellation.fromJson(cancelData);
        } catch (e) {
          logger.e("Home Repository Error [Get Slot Detail]", error: e);
        }
      }

      return null;
    } on DioException catch (e, s) {
      logger.e("Home Repository DioException [Get Slot Detail]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
      logger.e("Home Repository Error [Get Slot Detail]",
          error: e, stackTrace: s);
      return null;
    }
  }

  Future<Slot?> getSlotDetail(String id) async {
    try {
      final response =
          await apiClient.get("${ApiEndpoints.availableSlots}/$id");

      if (response.statusCode == 200) {
        var slotData = response.data['data'];
        try {
          return Slot.fromJson(slotData);
        } catch (e) {
          logger.e("Home Repository Error [Get Slot Detail]", error: e);
        }
      }

      return null;
    } on DioException catch (e, s) {
      logger.e("Home Repository DioException [Get Slot Detail]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
      logger.e("Home Repository Error [Get Slot Detail]",
          error: e, stackTrace: s);
      return null;
    }
  }

  Future initiatePayment(String slotId, bool useWallet) async {
    try {
      final response = await apiClient.authorizedPost(
        "${ApiEndpoints.initiatePayment}/$slotId",
        {
          "useWallet": useWallet,
        },
      );
      print('Response status');
      print(response.statusCode);
      if (response.statusCode == 200) {
        var bookingData = response.data['data'];
        try {
          return InitiateSufficientWalletModel.fromJson(bookingData);
        } catch (e) {
          logger.e("Home Repository Error [Initiate Payment]", error: e);
        }
      } else if (response.statusCode == 402) {
        print(response.data['razorpayOptions']);
        var razorpayData = response.data['razorpayOptions'];

        return razorpayData;
        // try {
        //   return InitiateRazorpayModel.fromJson(razorpayData);
        // } catch (e) {
        //   logger.e("Home Repository Error [Initiate Payment]", error: e);
        // }
      }

      return null;
    } on DioException catch (e, s) {
      print("Inside Dio catch");
      logger.e("Home Repository Dio Exception [Initiate Payment]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
      print('Inside Catch');
      logger.e("Home Repository Error [Initiate Payment]",
          error: e, stackTrace: s);
      return null;
    }
  }

  Future verifyPayment(String slotId, String paymentId, String orderId,
      String signature, bool useWallet) async {
    try {
      final response = await apiClient.authorizedPost(
        "${ApiEndpoints.verifyPayment}/$paymentId",
        {
          "razorpay_signature": signature,
          "razorpay_order_id": orderId,
          "slotId": slotId,
          "useWallet": useWallet,
        },
      );
      if (response.statusCode == 201) {
        var bookingData = response.data;
        try {
          return InitiateSufficientWalletModel.fromJson(bookingData);
        } catch (e) {
          logger.e("Home Repository Error [Initiate Payment]", error: e);
        }
      } else if (response.statusCode == 402) {
        var razorpayData = response.data['razorpayOptions'];

        return razorpayData;
      }

      return null;
    } on DioException catch (e, s) {
      print("Inside Dio catch");
      logger.e("Home Repository Dio Exception [Initiate Payment]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
      print('Inside Catch');
      logger.e("Home Repository Error [Initiate Payment]",
          error: e, stackTrace: s);
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
