import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a WalletState if you need to manage state
class WalletState {
  final String amount;
  final String paymentMode;

  WalletState({this.amount = '', this.paymentMode = ''});

  WalletState copyWith({String? amount, String? paymentMode}) {
    return WalletState(
      amount: amount ?? this.amount,
      paymentMode: paymentMode ?? this.paymentMode,
    );
  }
}

// Define WalletController extending StateNotifier
class WalletController extends StateNotifier<WalletState> {
  WalletController() : super(WalletState());

  final TextEditingController amountController = TextEditingController();
  final TextEditingController paymentModeController = TextEditingController();

  void updateAmount(String value) {
    state = state.copyWith(amount: value);
  }

  void updatePaymentMode(String value) {
    state = state.copyWith(paymentMode: value);
  }
}

// Create a provider for WalletController
final walletControllerProvider =
    StateNotifierProvider<WalletController, WalletState>(
  (ref) => WalletController(),
);
