import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/models/concrete_company_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/models/concrete_company_account_sign_up_response_model.dart';
import '../../../../../../../core/network/api_error_handler.dart';

class ConcreteCompanyAccountRepo {
  final ApiService _apiService;

  ConcreteCompanyAccountRepo(this._apiService);

  Future<ApiResult<ConcreteCompanyAccountSignUpResponseModel>> companySignUp(
      ConcreteCompanyAccountSignUpRequestModel
      concreteCompanyAccountSignUpRequestModel) async {
    try {
      final formData = await concreteCompanyAccountSignUpRequestModel.toFormData();
      final response = await _apiService.companySignUp(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
