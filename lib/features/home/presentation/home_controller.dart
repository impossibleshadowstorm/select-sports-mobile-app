import 'package:flutter_riverpod/flutter_riverpod.dart';

// A StateNotifier to manage currentImage and previousImage states
class HomeController extends StateNotifier<HomeControllerState> {
  HomeController() : super(HomeControllerState());

  void updateCurrentImage(int index) {
    state = HomeControllerState(
      currentImage: index,
      previousImage: state.currentImage,
    );
  }

  // Getter to determine if swipe direction is to the right
  bool get isSwipeRight => state.currentImage > state.previousImage;
}

// State class to encapsulate current and previous image indices
class HomeControllerState {
  final int currentImage;
  final int previousImage;

  HomeControllerState({
    this.currentImage = 0,
    this.previousImage = 0,
  });
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeControllerState>((ref) {
  return HomeController();
});
