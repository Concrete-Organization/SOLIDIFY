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
        "AIzaSyDZwGdFkTzhPd7FXX1ThTzG_ET2HNCh9wY",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
