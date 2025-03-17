class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/lottie_jsons/onboarding_ground_dark.json',
    'Choose Playground',
    'When you order Eat Street , \nwe\'ll hook you up with exclusive \ncoupons.',
  ),
  OnboardingModel(
    'assets/lottie_jsons/onboarding_play.json',
    'Play Hard',
    'We make it simple to find the \nfood you crave. Enter your \naddress and let',
  ),
  OnboardingModel(
    'assets/lottie_jsons/onboarding_play.json',
    'Choose Your Slot',
    'We make it simple to find the \nfood you crave. Enter your \naddress and let',
  ),
];