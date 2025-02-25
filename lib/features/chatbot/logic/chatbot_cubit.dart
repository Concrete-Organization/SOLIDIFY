import 'chatbot_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/chatbot/data/repos/chatbot_with_gemini_repo.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_request_model.dart'
    as req;
import 'package:solidify/features/chatbot/data/models/chatbot_response_model.dart'
    as res;

class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotWithGeminiRepo _chatbotRepo;

  ChatbotCubit(this._chatbotRepo) : super(const ChatbotState.initial());

  Future<void> sendMessage(String message) async {
    final request = req.ChatbotRequestModel(
      contents: [
        req.Content(parts: [req.Part(text: message)]),
      ],
    );

    emit(const ChatbotState.loading());

    final result = await _chatbotRepo.getChatbotResponse(request);

    result.when(
      success: (res.ChatbotResponseModel response) {
        emit(ChatbotState.success(request: request, response: response));
      },
      failure: (error) {
        emit(ChatbotState.error(error: error));
      },
    );
  }
}
