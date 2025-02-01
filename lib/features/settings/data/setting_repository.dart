import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';

class SettingRepository {
  final ApiClient apiClient;

  SettingRepository(this.apiClient);

  Future<Map<String, dynamic>> forgot(String email) async {
    try {
      final response = await apiClient.post(ApiEndpoints.fogrot, {
        'email': email,
      });

      final message = response.data['message'] ?? "Unexpected response";

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': message,
        };
      }

      return {'success': false, 'message': message};
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      return {'success': false, 'message': e.response?.data["message"]};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    try {
      final response = await apiClient.post(ApiEndpoints.verifyOtp, {
        'email': email,
        'otp': otp,
      });

      final message = response.data['message'] ?? "Unexpected response";

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': message,
        };
      }

      return {'success': false, 'message': message};
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      return {'success': false, 'message': e.response?.data["message"]};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

    Future<Map<String, dynamic>> updateContact(
      String currentContact, String newContact) async {
    try {
      final response = await apiClient.post(ApiEndpoints.resetPassword, {
        'currentContact': currentContact,
        'newContact': newContact,
      });

      final message = response.data['message'] ?? "Unexpected response";

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': response.data['data'],
          'message': "Login Successful",
        };
      }

      return {'success': false, 'message': message};
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      return {'success': false, 'message': e.response?.data["message"]};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> reset(
      String currentPassword, String newPassword) async {
    try {
      final response = await apiClient.post(ApiEndpoints.resetPassword, {
        'email': currentPassword,
        'newPassword': newPassword,
      });

      final message = response.data['message'] ?? "Unexpected response";

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': response.data['data'],
          'message': "Login Successful",
        };
      }

      return {'success': false, 'message': message};
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      return {'success': false, 'message': e.response?.data["message"]};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await apiClient.post(ApiEndpoints.login, {
        'email': email,
        'password': password,
      });

      final message = response.data['message'] ?? "Unexpected response";

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': response.data['data'],
          'message': "Login Successful",
        };
      }

      return {'success': false, 'message': message};
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data["error"]);
      }
      return {'success': false, 'message': e.response?.data["message"]};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
    String phone,
    String age,
  ) async {
    try {
      final response = await apiClient.post(ApiEndpoints.signup, {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'age': age,
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

final settingRepositoryProvider = Provider<SettingRepository>(
  (ref) => SettingRepository(
    ApiClient(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  ),
);
