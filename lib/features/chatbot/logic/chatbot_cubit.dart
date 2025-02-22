import 'chatbot_state.dart';
import 'package:bloc/bloc.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_request_model.dart';
import 'package:solidify/features/chatbot/data/models/chatbot_response_model.dart';
import 'package:solidify/features/chatbot/data/repos/chatbot_with_gemini_repo.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotWithGeminiRepo _chatbotRepo;

  ChatbotCubit(this._chatbotRepo) : super(const ChatbotState.initial());

  /// Sends a new message to Gemini.
  /// [message] is the current prompt and [history] is the optional summary of previous messages.
  Future<void> sendMessage(String message, {String? history}) async {
    final request = ChatbotRequestModel(
      prompt: Prompt(text: message),
      history: history,
    );

    emit(const ChatbotState.loading());

    final result = await _chatbotRepo.getChatbotResponse(request);

    result.when(
      success: (ChatbotResponseModel response) {
        emit(ChatbotState.success(request: request, response: response));
      },
      failure: (error) {
        emit(ChatbotState.error(error: error.apiErrorModel));
      },
    );
  }
}
