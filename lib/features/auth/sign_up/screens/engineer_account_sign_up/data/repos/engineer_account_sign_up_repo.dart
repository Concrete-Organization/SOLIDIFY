import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_response_model.dart';

class EngineerAccountSignUpRepo {
  final ApiService _apiService;

  EngineerAccountSignUpRepo(this._apiService);

  Future<ApiResult<EngineerAccountSignUpResponseModel>> engineerSignUp(
      EngineerAccountSignUpRequestModel engineerAccountSignUpRequestModel) async {
    try {
      final response = await _apiService.engineerSignUp(engineerAccountSignUpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
