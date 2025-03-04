import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_sports/core/constants/paths.dart';
import 'package:select_sports/core/constants/theme_constants.dart';
import 'package:select_sports/core/models/venue_model.dart';
import 'package:select_sports/core/widgets/custom_buttons.dart';
import 'package:select_sports/core/widgets/visibility_widgets.dart';
import 'package:select_sports/core/widgets/frosted_glass.dart';
import 'package:select_sports/features/home/presentation/home_controller.dart';
import 'package:select_sports/features/home/presentation/playground_details_screen.dart';
import 'package:select_sports/providers/theme_provider.dart';


class RazorpayScreen extends ConsumerStatefulWidget {
  const RazorpayScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RazorpayScreenState();
}

class _RazorpayScreenState extends ConsumerState<RazorpayScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
     _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
     _razorpay.clear(); 
    super.dispose();
  }
  
  void openCheckout() {
    var options = {
        "key":"rzp_test_YouRraZorPayKey",
         "order_id": "order_Q0pfdXdiC0eaiG",
        "amount": 10000,
        "name": "SELECT-SPORTS",
        "description": "Payment for Slot #b9fe83b2-fa0c-430f-8093-8e68a3b87912",
        "prefill": {
            "contact": "8923456783",
            "email": "Saurabh@user.com"
        },
        "external": {
            "wallets": [
                "paytm"
            ]
        }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
    );

    print("Payment Successfull");
    print(response.data);
    print(response.orderId);
    print(response.paymentId);
    print(response.signature);

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.message}")),
    );
    print("Payment Got Error");
    print(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("External Wallet Selected: ${response.walletName}")),
    );
        print("Payment in External wallet");
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Landing Section
              SizedBox(height: 10.w),
              // Box So that the data behind the bottom bar must be visible..
              SizedBox(height: 5.w),
                      CustomButtons.fullWidthFilledButton(
                        ref: ref,
                        buttonText: "Login",
                        onClick: () {
                        },
                      ),
            ],
          ),
        ),
      ),
    );
  }

}
