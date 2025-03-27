import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:select_sports/core/models/wallet_model.dart';
import 'package:select_sports/features/wallet/data/wallet_repository.dart';

// Define a WalletState if you need to manage state
class WalletState {
  final bool isLoading;
  final Wallet userWallet;

  WalletState({
    this.isLoading = false,
    required this.userWallet,
  });

  WalletState copyWith({bool? isLoading, Wallet? userWallet}) {
    return WalletState(
      isLoading: isLoading ?? this.isLoading,
      userWallet: userWallet ?? this.userWallet,
    );
  }
}

// Define WalletController extending StateNotifier
class WalletController extends StateNotifier<WalletState> {
  final WalletRepository walletRepository;

  WalletController(this.walletRepository)
      : super(WalletState(
            userWallet: Wallet(
          id: '',
          userId: '',
          balance: 0.0, // Changed Float to double
          createdAt: '',
          updatedAt: '',
          transactions: [],
        )));

  // final TextEditingController amountController = TextEditingController();
  // final TextEditingController paymentModeController = TextEditingController();

  // Future<Wallet?> fetchVenues() async {
  //   return await walletRepository.getWallet();
  // }

  Future<void> fetchUserWallet() async {
    state = state.copyWith(isLoading: true);

    final wallet = await walletRepository.getWallet();

    if (wallet != null) {
      state = state.copyWith(
        userWallet: wallet,
        isLoading: false,
      );
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  // void updateAmount(String value) {
  //   state = state.copyWith(amount: value);
  // }

  // void updatePaymentMode(String value) {
  //   state = state.copyWith(paymentMode: value);
  // }
}

// Create a provider for WalletController
final walletControllerProvider =
    StateNotifierProvider<WalletController, WalletState>((ref) {
  final walletRepository = ref.read(walletRepositoryProvider);
  return WalletController(walletRepository);
});
