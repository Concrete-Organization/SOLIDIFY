import 'api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:solidify/features/auth/login/data/model/login_request_body.dart';
import 'package:solidify/features/auth/login/data/model/login_response_body.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_response_model.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_request_model.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_response_model.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/models/concrete_company_account_sign_up_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/models/concrete_company_account_sign_up_response_model.dart';

// Import the category response model

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.engineerSignUP)
  Future<EngineerAccountSignUpResponseModel> engineerSignUp(
    @Body() EngineerAccountSignUpRequestModel engineerAccountSignUpRequestModel,
  );

  @POST(ApiConstants.companySignUp)
  @MultiPart()
  Future<ConcreteCompanyAccountSignUpResponseModel> companySignUp(
    @Body() FormData formData,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponseModel> verifyOtp(
    @Body() VerifyOtpRequestModel verifyOtpRequestModel,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
    @Body() ResetPasswordRequestModel resetPasswordRequestModel,
  );

  @GET(ApiConstants.product)
  Future<ProductListResponseModel> productsList();

  @GET("Category/{id}")
  Future<GetProductsByCategoryResponseModel> getCategory(
    @Path("id") int id,
  );
  @GET(ApiConstants.post)
  Future<GetPostsResponse> posts();
}
