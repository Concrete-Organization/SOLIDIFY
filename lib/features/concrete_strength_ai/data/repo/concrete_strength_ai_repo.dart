import 'package:solidify/features/concrete_strength_ai/data/api/concrete_strength_ai_api_call.dart';
import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_request_model.dart';
import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_response_model.dart';
import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';

class ConcreteStrengthAiRepo {
  final ConcreteStrengthAiApiCall _concreteStrengthAiApiCall;

  ConcreteStrengthAiRepo(this._concreteStrengthAiApiCall);

  Future<ApiResult<ConcreteAiResponseModel>> getConcreteAiResponse(
      ConcreteAiRequestModel concreteRequestModel) async {
    try {
      final response = await _concreteStrengthAiApiCall
          .getConcreteAiResponse(concreteRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}