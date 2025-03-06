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
  final Map<String, dynamic> razorpayOptions;
  final bool useWallet;
  final String slotId;

  const RazorpayScreen(
      {super.key,
      required this.razorpayOptions,
      required this.useWallet,
      required this.slotId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RazorpayScreenState();
}

class _RazorpayScreenState extends ConsumerState<RazorpayScreen> {
  late Razorpay _razorpay;
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    initializePayment();
  }

  void initializePayment() async{
    _homeController = ref.read(homeControllerProvider.notifier);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    openCheckout();

    // Ensures `openCheckout` runs after the first frame is rendered
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   openCheckout();
    // });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout() {
    try {
      _razorpay.open(widget.razorpayOptions);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
    );

    final verifyResponse = await _homeController.verifyPayment(
      widget.slotId,
      response.paymentId ?? '',
      response.orderId ?? '',
      response.signature ?? '',
      widget.useWallet,
    );
    print(verifyResponse);
    print(verifyResponse.statusCode);
    print(verifyResponse.data);
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
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10.w),
                SizedBox(height: 5.w),
                CustomButtons.fullWidthFilledButton(
                  ref: ref,
                  buttonText: "Pay now",
                  onClick: () {
                    openCheckout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// class _RazorpayScreenState extends ConsumerState<RazorpayScreen> {
//   late Razorpay _razorpay;
//   late HomeController _homeController;

//   @override
//   void initState() async{
//     super.initState();
//     _homeController = ref.read(homeControllerProvider.notifier);
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     openCheckout();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _razorpay.clear();
//     super.dispose();
//   }

//   void openCheckout() async{
//     try {
//       _razorpay.open(widget.razorpayOptions); // Use passed options
//     } catch (e) {
//       debugPrint('Error: $e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
//     );

//     final verifyResponse = await _homeController.verifyPayment(
//         widget.slotId,
//         response.paymentId ?? '',
//         response.orderId ?? '',
//         response.signature ?? '',
//         widget.useWallet);
//     print(verifyResponse);
//     print(verifyResponse.statusCode);
//     print(verifyResponse.data);
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Payment Failed: ${response.message}")),
//     );
//     print("Payment Got Error");
//     print(response);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//           content: Text("External Wallet Selected: ${response.walletName}")),
//     );
//     print("Payment in External wallet");
//     print(response);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

//     return Scaffold(
//       body: SizedBox(
//         height: 100.h,
//         width: 100.w,
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 // Top Landing Section
//                 SizedBox(height: 10.w),
//                 // Box So that the data behind the bottom bar must be visible..
//                 SizedBox(height: 5.w),
//                 CustomButtons.fullWidthFilledButton(
//                   ref: ref,
//                   buttonText: "Pay now",
//                   onClick: () {
//                     openCheckout();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
