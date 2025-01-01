import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/data/models/engineer_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/data/models/engineer_sign_up_response_model.dart';
import '../../../../../../../core/network/api_error_handler.dart';

class EngineerSignUpRepo {
  final ApiService _apiService;

  EngineerSignUpRepo(this._apiService);

  Future<ApiResult<EngineerSignUpResponseModel>> engineerSignUp(
      EngineerSignUpRequestModel engineerSignUpRequestModel) async {
    try {
      final response = await _apiService.engineerSignUp(engineerSignUpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
