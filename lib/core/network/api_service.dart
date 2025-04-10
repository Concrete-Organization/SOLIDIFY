import 'api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:solidify/core/network/refresh_token_model.dart';
import 'package:solidify/features/auth/login/data/model/login_request_body.dart';
import 'package:solidify/features/auth/login/data/model/login_response_body.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:solidify/features/marketplace/order/data/models/order_post_request.dart';
import 'package:solidify/features/marketplace/order/data/models/order_response_model.dart';
import 'package:solidify/features/profile_company/data/models/get_order_response_model.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/data/models/post_models/like_post_response.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';
import 'package:solidify/features/marketplace/cart/data/models/post_cart_response_model.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_response.dart';
import 'package:solidify/features/community/data/models/comment_models/create_reply_request.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/profile_engineer/data/models/get_engineer_profile_response.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_request_model.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_response.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_response_model.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_response_model.dart';
import 'package:solidify/features/profile_engineer/data/models/update_engineer_profile_response.dart';
import 'package:solidify/features/profile_engineer/data/models/delete_engineer_profile_response.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_request_model.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_response_model.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_products_by_category_response_model.dart';
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
  Future<ProductListResponseModel> productsList(
    @Query('PageNumber') int page,
  );

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
  Future<GetPostsResponse> posts(
    @Query('PageNumber') int? page,
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.post)
  @MultiPart()
  Future<CreatePostResponse> createPost(
    @Body() FormData formData,
  );

  @GET('${ApiConstants.comment}/{id}')
  Future<GetCommentsResponse> comments(
    @Path('id') int postId,
    @Query('PageNumber') int pageNumber,
    @Header('Authorization') String token,
  );

  @POST('${ApiConstants.comment}/{id}')
  Future<CreateCommentResponse> createComment(
    @Path('id') int postId,
    @Body() CreateCommentRequest createCommentRequest,
  );

  @POST('${ApiConstants.reply}/{commentId}')
  Future<CreateCommentResponse> reply(
    @Path('commentId') int commentId,
    @Body() CreateReplyRequest request,
  );

  @POST('${ApiConstants.likePost}/{id}')
  Future<LikePostResponse> likePost(
    @Path('id') int postId,
  );

  @DELETE('${ApiConstants.likePost}/{id}')
  Future<LikePostResponse> deleteLikePost(
    @Path('id') int postId,
  );

  @POST('${ApiConstants.likeComment}/{commentId}')
  Future<LikePostResponse> likeComment(
    @Path('commentId') int commentId,
  );

  @DELETE('${ApiConstants.likeComment}/{commentId}')
  Future<LikePostResponse> deleteLikeComment(
    @Path('commentId') int commentId,
  );

  @POST('${ApiConstants.likeReply}/{replyId}')
  Future<LikePostResponse> likeReply(
    @Path('replyId') int replyId,
  );

  @DELETE('${ApiConstants.likeReply}/{replyId}')
  Future<LikePostResponse> deleteLikeReply(
    @Path('replyId') int replyId,
  );

  @GET(ApiConstants.productWithId)
  Future<GetProductByIdResponseBody> getProductById(
    @Path('id') String productId,
  );

  @GET(ApiConstants.cart)
  Future<GetCartResponseModel> cartList(
    @Header('Authorization') String token,
  );

  @DELETE("CartItem/{id}")
  Future<void> deleteCartItem(
    @Path("id") String id,
    @Header('Authorization') String token,
  );

  @GET('${ApiConstants.engineerProfile}/{id}')
  Future<GetEngineerProfileResponse> engineerProfile(
    @Path('id') String id,
  );

  @PATCH('${ApiConstants.engineerProfile}/{id}')
  @MultiPart()
  Future<UpdateEngineerProfileResponse> updateEngineerProfile(
    @Path('id') String id,
    @Body() FormData formData,
  );

  @DELETE('${ApiConstants.engineerProfile}/{id}')
  Future<DeleteEngineerProfileResponse> deleteEngineerProfile(
    @Path('id') String id,
  );

  @POST(ApiConstants.shippingAddress)
  Future<ShippingAddressResponseModel> createShippingAddress(
    @Body() ShippingAddressRequestModel request,
  );
  @GET(ApiConstants.product)
  Future<ProductListResponseModel> searchProducts(
    @Query('PageNumber') int page,
    @Query('MinPrice') double? minPrice,
    @Query('MaxPrice') double? maxPrice,
    @Query('SearchedPhrase') String? searchedPhrase,
    @Query('CategoryName') String? categoryName,
    @Query('BrandName') String? brandName,
  );

  @POST(ApiConstants.order)
  Future<OrderResponseModel> createOrder(
    @Body() OrderPostRequest request,
    @Header('Authorization') String token,
  );
  @GET(ApiConstants.order)
  Future<GetOrderResponseModel> getOrders(
    @Query('PageNumber') int page,
    @Header('Authorization') String token,
  );
}
