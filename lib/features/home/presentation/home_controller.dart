import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/core/models/slot_model.dart';
import 'package:select_sports/core/models/venue_model.dart';
import 'package:select_sports/features/home/data/home_repository.dart';
import 'package:select_sports/utils/app_logger.dart';

// A StateNotifier to manage currentImage and previousImage states
class HomeController extends StateNotifier<HomeControllerState> {
  final HomeRepository homeRepository;

  HomeController(this.homeRepository) : super(HomeControllerState());

  void updateCurrentImage(int index) {
    state = state.copyWith(
      currentImage: index,
      previousImage: state.currentImage,
    );
  }

  void updatePaymentMode(int index) {
    state = state.copyWith(selectedPaymentMode: index);
  }

  Future<List<Venue>> fetchVenues() async {
    return await homeRepository.getVenues();
  }

  Future<Venue?> fetchVenueDetail(String id) async {
    return await homeRepository.getVenueDetail(id);
  }

  Future initiatePayment(String slotId, bool useWallet) async {
    return await homeRepository.initiatePayment(slotId, useWallet);
  }

  Future verifyPayment(String slotId, String paymentId, String orderId,
      String signature, bool useWallet) async {
    return await homeRepository.verifyPayment(
        slotId, paymentId, orderId, signature, useWallet);
  }

  Future<void> fetchSlotDetail(String id) async {
    try {
      final slot = await homeRepository.getSlotDetail(id);
      state = state.copyWith(
        slotDetail: slot,
      );
    } catch (err, stack) {
      logger.e("Home Controller Error [Slot Detail]",
          error: err, stackTrace: stack);
    }
  }

  // Getter to determine if swipe direction is to the right
  bool get isSwipeRight => state.currentImage > state.previousImage;
}

// State class to encapsulate current and previous image indices
class HomeControllerState {
  final int currentImage;
  final int previousImage;
  final Slot? slotDetail;
  final int selectedPaymentMode;

  HomeControllerState({
    this.currentImage = 0,
    this.previousImage = 0,
    this.selectedPaymentMode = 0,
    this.slotDetail,
  });

  // CopyWith method for immutability
  HomeControllerState copyWith({
    int? currentImage,
    int? previousImage,
    int? selectedPaymentMode,
    Slot? slotDetail,
  }) {
    return HomeControllerState(
      currentImage: currentImage ?? this.currentImage,
      previousImage: previousImage ?? this.previousImage,
      selectedPaymentMode: selectedPaymentMode ?? this.selectedPaymentMode,
      slotDetail: slotDetail,
    );
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeControllerState>((ref) {
  final homeRepository = ref.read(homeRepositoryProvider);
  return HomeController(homeRepository);
});
