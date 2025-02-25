import '../../../../../core/network/api_error_handler.dart';
import '../../../../../core/network/api_result.dart';
import '../../../../../core/network/api_service.dart';
import '../models/forget_password_request_model.dart';
import '../models/forget_password_response_model.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);

  Future<ApiResult<ForgetPasswordResponseModel>> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    try {
      final response = await _apiService.forgetPassword(forgetPasswordRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}