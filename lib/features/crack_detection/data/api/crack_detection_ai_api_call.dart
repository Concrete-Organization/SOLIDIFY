import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:solidify/core/network/api_constants.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_request_model.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_response_model.dart';

part 'crack_detection_ai_api_call.g.dart';

@RestApi(baseUrl: ApiConstants.crackDetectionAiApiBaseUrl)
abstract class CrackDetectionAiApiCall {
  factory CrackDetectionAiApiCall(Dio dio, {String baseUrl}) =
      _CrackDetectionAiApiCall;

  @POST(ApiConstants.predict)
  Future<CrackDetectionResponseModel> getCrackAiResponse(
    @Body() CrackDetectionRequestModel crackDetectionAiRequestModel,
  );
}
