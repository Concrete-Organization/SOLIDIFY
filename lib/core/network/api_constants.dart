class ApiConstants {
  static const String apiBaseUrl = "https://solidifyapi.runasp.net/api/";
  static const String concreteStrengthAiApiBaseUrl =
      "https://mahmoud763-concrete.hf.space/";
  static const String geminiApiUrl =
      "https://generativelanguage.googleapis.com/v1beta/";

  static const String login = "Account/login";
  static const String engineerSignUP = 'Account/registerEngineer';
  static const String forgetPassword = 'Account/forgot-password';
  static const String verifyOtp = 'Account/verifyOtp';
  static const String resetPassword = 'Account/reset-password';
  static const String companySignUp = 'Account/registerCompany';
  static const String refreshToken = 'Account/refreshToken';
  static const String predict = 'predict';
  static const String product = 'Product';
  static const String post = 'Post';

  /// Returns the endpoint for a category with the given [id].
  static String categoryEndpoint(int id) => "Category/$id";

  /// Returns the endpoint for a CartItem with the given [id].
  static String cartItemEndpoint(String id) => "CartItem/$id";
}
