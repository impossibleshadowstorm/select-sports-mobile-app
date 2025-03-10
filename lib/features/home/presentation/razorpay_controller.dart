import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:select_sports/features/bookings/presentation/bookings_screen.dart';
import 'package:select_sports/features/home/presentation/home_controller.dart';
import 'package:select_sports/features/home/presentation/playground_details_screen.dart';
import 'package:select_sports/features/main/presentation/main_controller.dart';
import 'package:select_sports/features/main/presentation/main_screen.dart';
import 'package:select_sports/providers/navigator_key.dart';

final razorpayControllerProvider = Provider((ref) => RazorpayController(ref));

class RazorpayController {
  final Ref ref;
  late Razorpay _razorpay;
  String? _slotId;
  bool? _useWallet;
  late HomeController _homeController;

  RazorpayController(this.ref) {
    initializePayment();
  }

  void initializePayment() {
    _homeController = ref.read(homeControllerProvider.notifier);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }

  void openCheckout(
      Map<String, dynamic> razorpayOptions, String slotId, bool useWallet) {
    try {
      _slotId = slotId;
      _useWallet = useWallet;
      _razorpay.open(razorpayOptions);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    debugPrint("Payment Successful: ${response.paymentId}");

    final verifyResponse = await _homeController.verifyPayment(
      _slotId!, // Pass correct slotId dynamically
      response.paymentId ?? '',
      response.orderId ?? '',
      response.signature ?? '',
      _useWallet!, // Pass useWallet dynamically
    );

    if (verifyResponse.status == 201) {
      // For Navigator
      final mainController = ref.read(mainControllerProvider.notifier);
      mainController.updateIndex(4); // Update to the 4th index
      Navigator.pushReplacement(
        ref.read(navigatorKeyProvider).currentContext!,
        MaterialPageRoute(builder: (context) => BookingsScreen()),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint("Payment Failed: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("External Wallet Selected: ${response.walletName}");
  }
}
