import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/chatbot/data/api/chatbot_api_call.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_request_model.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_response_model.dart';

class ChatbotWithGeminiRepo {
  final ChatbotApiService _chatbotApiService;

  ChatbotWithGeminiRepo(this._chatbotApiService);

  Future<ApiResult<ChatbotResponseModel>> getChatbotResponse(
      ChatbotRequestModel requestModel) async {
    try {
      final response = await _chatbotApiService.getChatbotResponse(
        requestModel,
        "AIzaSyAAm0lpw1D2My1Rni6BW7y5YKbTnnjfGps",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
