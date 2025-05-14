import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/features/crack_detection/data/api/crack_detection_ai_api_call.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_request_model.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_response_model.dart';

class CrackDetectionAiRepo {
  final CrackDetectionAiApiCall _crackDetectionAiApiCall;

  CrackDetectionAiRepo(this._crackDetectionAiApiCall);

  Future<ApiResult<CrackDetectionResponseModel>> getCrackAiResponse(
      CrackDetectionRequestModel crackDetectionRequestModel) async {
    try {
      if (crackDetectionRequestModel.image == null) {
        return ApiResult.failure(ApiErrorHandler.handle("Image is required"));
      }
      final formData = await crackDetectionRequestModel.toFormData();
      final response = await _crackDetectionAiApiCall.getCrackAiResponse(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}