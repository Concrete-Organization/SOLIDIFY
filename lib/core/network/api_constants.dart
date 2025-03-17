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
  static const String comment = 'Comment';
  static const String likePost = 'Like/post';
  static const String likeComment = 'Like/comment';
  static const String likeReply = 'Like/reply';
  static const String reply = 'reply';
  static String categoryEndpoint(int id) => "Category/$id";
  static String cartItemEndpoint(String id) => "CartItem/$id";
  static const String productWithId = "Product/{id}";
  static const String cart = "Cart";
  static const String engineerProfile = "EngineerProfile";
}
