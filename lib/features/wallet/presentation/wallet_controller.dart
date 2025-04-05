import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:select_sports/core/models/wallet_model.dart';
import 'package:select_sports/features/wallet/data/wallet_repository.dart';

class WalletController {
  final WalletRepository walletRepository;

  WalletController(this.walletRepository);

  Future<WalletResponse?> getWalletDetails() async {
    return await walletRepository.getWallet();
  }
}

final walletControllerProvider = Provider<WalletController>(
      (ref) {
    final repository = ref.watch(walletRepositoryProvider);
    return WalletController(repository);
  },
);

