class ApiEndpoints {
  static const String baseUrl = "http://15.206.145.136:3005/api";

  // Auth Endpoints
  static const String login = "/auth/login";
  static const String signup = "/auth/register";
  static const String me = "/auth/me";
  static const String forgot = "/auth/forgot-password";
  static const String resetPassword = "/auth/reset-password";
  static const String verifyOtp = "/auth/verify-account";
  static const String userProfile = "/user/sports-profile";
  static const String availableSlots = "/slots";
  static const String venues = "/venues";
  static const String sportsProfileOptions = "/user/sports-profile-options";
}
