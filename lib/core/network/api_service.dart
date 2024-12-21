import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/login/data/model/login_request_body.dart';
import '../../features/auth/login/data/model/login_response_body.dart';
import 'api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
