class ApiEndpoints {
  static const String baseUrl = "http://localhost:3000/api";

  // Auth Endpoints
  static const String login = "/auth/login";
  static const String signup = "/auth/register";
  static const String me = "/auth/me";
  static const String fogrot = "/auth/forgot-password";
  static const String resetPassword = "/auth/reset-password";
  static const String verifyOtp = "/auth/verify-account";
}
