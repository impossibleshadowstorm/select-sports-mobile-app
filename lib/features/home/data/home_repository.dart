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

      if (response.statusCode == 200) {
        var bookingData = response.data['data'];
        try {
          return InitiateSufficientWalletModel.fromJson(bookingData);
        } catch (e) {
          logger.e("Home Repository Error [Initiate Payment]", error: e);
        }
      } else if (response.statusCode == 402) {
        var razorpayData = response.data['data'];
        try {
          return InitiateRazorpayModel.fromJson(razorpayData);
        } catch (e) {
          logger.e("Home Repository Error [Initiate Payment]", error: e);
        }
      }

      return null;
    } on DioException catch (e, s) {
      logger.e("Home Repository Dio Exception [Initiate Payment]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
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
