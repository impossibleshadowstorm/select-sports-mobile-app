// class Wallet {
//   final String id;
//   final String userId;
//   final int balance;
//   final String createdAt;
//   final String updatedAt;

//   Wallet({
//     required this.id,
//     required this.userId,
//     required this.balance,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Wallet.fromJson(Map<String, dynamic> json) {
//     return Wallet(
//       id: json['id'],
//       userId: json['userId'],
//       balance: json['balance'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }
// }

// class Transaction {
//   final String id;
//   final String userId;
//   final String method;
//   final int amount;
//   final String currency;
//   final String status;
//   final String createdAt;
//   final String updatedAt;
//   final Razorpay? razorpay;
//   final WalletTransaction? walletTxn;

//   Transaction({
//     required this.id,
//     required this.userId,
//     required this.method,
//     required this.amount,
//     required this.currency,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     this.razorpay,
//     this.walletTxn,
//   });

//   factory Transaction.fromJson(Map<String, dynamic> json) {
//     return Transaction(
//       id: json['id'],
//       userId: json['userId'],
//       method: json['method'],
//       amount: json['amount'],
//       currency: json['currency'],
//       status: json['status'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//       razorpay:
//           json['razorpay'] != null ? Razorpay.fromJson(json['razorpay']) : null,
//       walletTxn: json['walletTxn'] != null
//           ? WalletTransaction.fromJson(json['walletTxn'])
//           : null,
//     );
//   }
// }

// class Razorpay {
//   final String id;
//   final String transactionId;
//   final String razorpayOrderId;
//   final String razorpayPaymentId;
//   final String razorpaySignature;
//   final String createdAt;
//   final String updatedAt;

//   Razorpay({
//     required this.id,
//     required this.transactionId,
//     required this.razorpayOrderId,
//     required this.razorpayPaymentId,
//     required this.razorpaySignature,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Razorpay.fromJson(Map<String, dynamic> json) {
//     return Razorpay(
//       id: json['id'],
//       transactionId: json['transactionId'],
//       razorpayOrderId: json['razorpayOrderId'],
//       razorpayPaymentId: json['razorpayPaymentId'],
//       razorpaySignature: json['razorpaySignature'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }
// }

// class WalletTransaction {
//   final String id;
//   final String transactionId;
//   final String walletId;
//   final String transactionType;
//   final String createdAt;
//   final String updatedAt;

//   WalletTransaction({
//     required this.id,
//     required this.transactionId,
//     required this.walletId,
//     required this.transactionType,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory WalletTransaction.fromJson(Map<String, dynamic> json) {
//     return WalletTransaction(
//       id: json['id'],
//       transactionId: json['transactionId'],
//       walletId: json['walletId'],
//       transactionType: json['transactionType'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }
// }

// class WalletData {
//   final Wallet wallet;
//   final List<Transaction>? transactions;

//   WalletData({
//     required this.wallet,
//     this.transactions,
//   });

//   factory WalletData.fromJson(Map<String, dynamic> json) {
//     return WalletData(
//       wallet: Wallet.fromJson(json['wallet']),
//       transactions: json['transactions'] != null
//           ? List<Transaction>.from(
//               json['transactions'].map((x) => Transaction.fromJson(x)))
//           : null,
//     );
//   }
// }



import 'dart:ffi';

class Wallet {
  final String id;
  final String userId;
  final double balance;
  final String createdAt;
  final String updatedAt;
  final List<Transaction>? transactions;

  Wallet({
    required this.id,
    required this.userId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    this.transactions,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      userId: json['userId'],
      balance: json['balance'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      transactions: json['transactions'] != null
          ? List<Transaction>.from(json['transactions'].map((x) => Transaction.fromJson(x)))
          : null,
    );
  }
}

class Transaction {
  final String id;
  final String userId;
  final String method;
  final int amount;
  final String currency;
  final String status;
  final String createdAt;
  final String updatedAt;
  final Razorpay? razorpay;
  final WalletTransaction? walletTxn;

  Transaction({
    required this.id,
    required this.userId,
    required this.method,
    required this.amount,
    required this.currency,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.razorpay,
    this.walletTxn,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['userId'],
      method: json['method'],
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      razorpay: json['razorpay'] != null ? Razorpay.fromJson(json['razorpay']) : null,
      walletTxn: json['walletTxn'] != null ? WalletTransaction.fromJson(json['walletTxn']) : null,
    );
  }
}

class Razorpay {
  final String id;
  final String transactionId;
  final String razorpayOrderId;
  final String razorpayPaymentId;
  final String razorpaySignature;
  final String createdAt;
  final String updatedAt;

  Razorpay({
    required this.id,
    required this.transactionId,
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpaySignature,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Razorpay.fromJson(Map<String, dynamic> json) {
    return Razorpay(
      id: json['id'],
      transactionId: json['transactionId'],
      razorpayOrderId: json['razorpayOrderId'],
      razorpayPaymentId: json['razorpayPaymentId'],
      razorpaySignature: json['razorpaySignature'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class WalletTransaction {
  final String id;
  final String transactionId;
  final String walletId;
  final String transactionType;
  final String createdAt;
  final String updatedAt;

  WalletTransaction({
    required this.id,
    required this.transactionId,
    required this.walletId,
    required this.transactionType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      id: json['id'],
      transactionId: json['transactionId'],
      walletId: json['walletId'],
      transactionType: json['transactionType'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

