import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/constants/api_endpoints.dart';
import 'package:select_sports/core/models/wallet_model.dart';
import 'package:select_sports/core/network/api_client.dart';
import 'package:select_sports/utils/app_logger.dart';

class WalletRepository {
  final ApiClient apiClient;

  WalletRepository(this.apiClient);

  Future<Wallet?> getWallet() async {
    try {
      final response = await apiClient.authorizedGet(ApiEndpoints.wallet);

      if (response.statusCode == 200) {
        dynamic walletData = response.data['data'];
        try {
          return Wallet.fromJson(walletData);
        } catch (e) {
          logger.e("Wallet Repository Error [Parsing Wallet]", error: e);
        }
      }

      return null;
    } on DioException catch (e, s) {
      logger.e("Wallet Repository Dio Exception [Get Wallet]",
          error: e, stackTrace: s);
      return null;
    } catch (e, s) {
      logger.e("Wallet Repository Error [Get Wallet]", error: e, stackTrace: s);
      return null;
    }
  }


}


final walletRepositoryProvider = Provider<WalletRepository>(
  (ref) => WalletRepository(
    ApiClient(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  ),
);
