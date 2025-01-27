import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import '../models/business_account_sign_up_request_model.dart';
import '../../../../../../../core/network/api_error_handler.dart';
import '../../../engineer_sign_up/data/models/engineer_sign_up_response_model.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/data/models/business_account_sign_up_response_model.dart';

class BusinessAccountRepo {
  final ApiService _apiService;

  BusinessAccountRepo(this._apiService);

  Future<ApiResult<BusinessAccountSignUpResponseModel>> componySignUp(
      BusinessAccountSignUpRequestModel
          businessAccountSignUpRequestModel) async {
    try {
      final formData = await businessAccountSignUpRequestModel.toFormData();
      final response = await _apiService.componySignUp(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
