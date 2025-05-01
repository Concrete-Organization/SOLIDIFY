import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_response_model.dart';

class VerifyOtpRepo {
  final ApiService _apiService;

  VerifyOtpRepo(this._apiService);

  Future<ApiResult<VerifyOtpResponseModel>> verifyOtp(
      VerifyOtpRequestModel verifyOtpRequestModel) async {
    try {
      final response = await _apiService.verifyOtp(verifyOtpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}