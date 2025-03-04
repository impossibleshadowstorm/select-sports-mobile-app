import 'package:select_sports/utils/app_logger.dart';

class RazorpayOptions {
  final String key;
  final String orderId;
  final int amount;
  final String name;
  final String description;
  final Prefill prefill;
  final Notes notes;
  final External external;

  RazorpayOptions({
    required this.key,
    required this.orderId,
    required this.amount,
    required this.name,
    required this.description,
    required this.prefill,
    required this.notes,
    required this.external,
  });

  factory RazorpayOptions.fromJson(Map<String, dynamic> json) {
    return RazorpayOptions(
      key: json['key'],
      orderId: json['order_id'],
      amount: json['amount'],
      name: json['name'],
      description: json['description'],
      prefill: Prefill.fromJson(json['prefill']),
      notes: Notes.fromJson(json['notes']),
      external: External.fromJson(json['external']),
    );
  }
}

class Prefill {
  final String contact;
  final String email;

  Prefill({required this.contact, required this.email});

  factory Prefill.fromJson(Map<String, dynamic> json) {
    return Prefill(
      contact: json['contact'],
      email: json['email'],
    );
  }
}

class Notes {
  final String walletBalance;
  final String remainingAmount;

  Notes({required this.walletBalance, required this.remainingAmount});

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      walletBalance: json['walletBalance'],
      remainingAmount: json['remainingAmount'],
    );
  }
}

class External {
  final List<String> wallets;

  External({required this.wallets});

  factory External.fromJson(Map<String, dynamic> json) {
    return External(
      wallets: List<String>.from(json['wallets'] ?? []),
    );
  }
}

class InitiateRazorpayModel {
  final bool success;
  final bool useWallet;
  final String message;
  final int amountToPay;
  final RazorpayOptions razorpayOptions;

  InitiateRazorpayModel({
    required this.success,
    required this.useWallet,
    required this.message,
    required this.amountToPay,
    required this.razorpayOptions,
  });

  factory InitiateRazorpayModel.fromJson(Map<String, dynamic> json) {
    try {
      return InitiateRazorpayModel(
        success: json['success'],
        useWallet: json['useWallet'],
        message: json['message'],
        amountToPay: json['amountToPay'],
        razorpayOptions: RazorpayOptions.fromJson(json['razorpayOptions']),
      );
    } catch (e, s) {
      logger.e("PaymentResponse Model Parsing Failed", error: e, stackTrace: s);
      throw Exception("PaymentResponse parsing failed");
    }
  }
}
