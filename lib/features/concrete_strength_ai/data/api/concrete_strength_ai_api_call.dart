import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:solidify/core/network/api_constants.dart';
import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_request_model.dart';
import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_response_model.dart';
part 'concrete_strength_ai_api_call.g.dart';

@RestApi(baseUrl: ApiConstants.concreteStrengthAiApiBaseUrl)
abstract class ConcreteStrengthAiApiCall {
  factory ConcreteStrengthAiApiCall(Dio dio, {String baseUrl}) =
      _ConcreteStrengthAiApiCall;

  @POST(ApiConstants.predict)
  Future<ConcreteAiResponseModel> getConcreteAiResponse(
    @Body() ConcreteAiRequestModel concreteAiRequestModel,
  );
}
