import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/features/rewards/repository/reward_model.dart';

class CouponController extends StateNotifier<List<Coupon>> {
  CouponController() : super([]) {
    fetchCoupons();
  }

  // Simulate fetching coupons from an API or database
  Future<void> fetchCoupons() async {
    await Future.delayed(const Duration(seconds: 2));
    state = [
      // Coupon(
      //   code: 'NEW50',
      //   description: 'Save 50% OFF on first orders above ₹999',
      //   minPurchaseAmount: 999.0,
      //   offerDetails:
      //       'Save 50% on first orders over ₹999 when you use the code NEW50.',
      // ),
      // Coupon(
      //   code: 'TRYNEW',
      //   description: 'Add ₹99 more to avail this offer',
      //   minPurchaseAmount: 99.0,
      //   offerDetails:
      //       'Hostinger Offers Up To 90% OFF Exclusive Offer: Up To 80% OFF + Extra 10% OFF On Web Hosting + 3 Months FREE',
      // ),
      // Coupon(
      //   code: 'NEW50',
      //   description: 'Save 50% OFF on first orders above ₹999',
      //   minPurchaseAmount: 999.0,
      //   offerDetails:
      //       'Save 50% on first orders over ₹999 when you use the code NEW50.',
      // ),
    ];
  }
}

// Provider for CouponController
final couponProvider =
    StateNotifierProvider<CouponController, List<Coupon>>((ref) {
  return CouponController();
});
