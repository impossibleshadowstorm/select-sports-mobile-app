import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/user_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/features/profile/data/models/profile_model.dart';
import 'package:select_sports/features/profile/data/models/profile_options_model.dart';

class ProfileRepository {
  final ApiClient apiClient;

  ProfileRepository(this.apiClient);

  Future<Profile?> getSportsProfile() async {
    try {
      final response = await apiClient.authorizedGet(ApiEndpoints.userProfile);

      if (response.statusCode == 200) {
        return Profile.fromJson(response.data['data']);
      }

      return null;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Profile Repository Error:");
        print(e.response?.data["error"]);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> getProfile() async {
    try {
      final response = await apiClient.authorizedGet(ApiEndpoints.me);

      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      }

      return null;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Profile Repository Error:");
        print(e);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<ProfileOptions?> getProfileOptions() async {
    try {
      final response = await apiClient.authorizedGet(ApiEndpoints.sportsProfileOptions);

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
    Future<Map<String, dynamic>> updateProfile(
    String name,
    String phone,
    String dob,
    String gender,
    String role,
  ) async {
    try {
      final response = await apiClient.post(ApiEndpoints.signup, {
        'name': name,
        'phone': phone,
        'dob': dob,
        'gender': gender,
        'role':role,
      });

      final message = response.data['message'] ?? "Unexpected response";

      if (response.statusCode == 201) {
        return {
          'success': true,
          'data': response.data['data'],
          'message': response.data['message'],
        };
      }

      return {'success': false, 'message': message};
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      // Check if the response contains a valid error message
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data.containsKey("message")) {
        return {'success': false, 'message': data["message"]};
      }

      return {'success': false, 'message': "An unknown error occurred."};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(
    ApiClient(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  ),
);
