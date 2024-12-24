import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import '../../../../../../../core/network/api_error_handler.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/models/user_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/models/user_sign_up_response_model.dart';

class UserSignUpRepo {
  final ApiService _apiService;

  UserSignUpRepo(this._apiService);

  Future<ApiResult<UserSignUpResponseModel>> userSignUp(
      UserSignUpRequestModel userSignUpRequestModel) async {
    try {
      final response = await _apiService.userSignUp(userSignUpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
