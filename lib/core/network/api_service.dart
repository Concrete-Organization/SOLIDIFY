import 'api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/login/data/model/login_request_body.dart';
import '../../features/auth/login/data/model/login_response_body.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/models/user_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/models/user_sign_up_response_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.userSignUP)
  Future<UserSignUpResponseModel> userSignUp(
    @Body() UserSignUpRequestModel userSignUpRequestModel,
  );
}
