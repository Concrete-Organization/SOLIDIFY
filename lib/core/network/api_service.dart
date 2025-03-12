import 'package:solidify/core/network/refresh_token_model.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_response.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:solidify/features/auth/login/data/model/login_request_body.dart';
import 'package:solidify/features/auth/login/data/model/login_response_body.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:solidify/features/marketplace/data/models/post_cart_response_model.dart';
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/marketplace/data/models/get_product_by_id_response_body.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_response_model.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_request_model.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_response_model.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/models/concrete_company_account_sign_up_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponseModel> refreshToken(
    @Body() RefreshTokenRequestModel refreshTokenRequestModel,
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

  @POST("CartItem/{id}")
  Future<PostCartResponseModel> addCartItem(
    @Path("id") String id,
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.post)
  Future<GetPostsResponse> posts();

  @GET('${ApiConstants.comment}/{id}')
  Future<GetCommentsResponse> comments(
    @Path('id') int postId,
    @Header('Authorization') String token,
  );

  @POST('${ApiConstants.comment}/{id}')
  Future<CreateCommentResponse> createComment(
    @Path('id') int postId,
    @Body() CreateCommentRequest createCommentRequest,
  );

  @GET(ApiConstants.productWithId)
  Future<GetProductByIdResponseBody> getProductById(
    @Path('id') String productId,
  );
}
