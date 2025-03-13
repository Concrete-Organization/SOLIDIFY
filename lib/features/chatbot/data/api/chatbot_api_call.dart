import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:solidify/core/network/api_constants.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_request_model.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_response_model.dart';

part 'chatbot_api_call.g.dart';

@RestApi(baseUrl: ApiConstants.geminiApiUrl)
abstract class ChatbotApiService {
  factory ChatbotApiService(Dio dio, {String baseUrl}) = _ChatbotApiService;

  @POST("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent")
  Future<ChatbotResponseModel> getChatbotResponse(
    @Body() ChatbotRequestModel chatbotRequestModel,
    @Query("key") String apiKey,
  );
}
