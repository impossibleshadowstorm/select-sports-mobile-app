import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/core/network/shared_preferences_helper.dart';
import 'package:select_sports/core/constants/shared_preferences_keys.dart';

class SplashRepository {
  final ApiClient apiClient;

  SplashRepository(this.apiClient);

  /// Check if the token is valid by calling the `/me` endpoint
  Future<bool> checkTokenValidity() async {
    try {
      final response = await apiClient.authorizedGet('/me');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Check if the app was already visited
  Future<bool> hasAlreadyVisited() async {
    return SharedPreferencesHelper.get(SharedPreferencesKeys.alreadyVisited) ??
        false;
  }

  /// Set the value for the "already visited" flag
  Future<void> setAlreadyVisited(bool value) async {
    await SharedPreferencesHelper.set(SharedPreferencesKeys.alreadyVisited, value);
  }
}

final splashRepositoryProvider = Provider<SplashRepository>(
  (ref) => SplashRepository(ApiClient(baseUrl: ApiEndpoints.baseUrl)),
);
