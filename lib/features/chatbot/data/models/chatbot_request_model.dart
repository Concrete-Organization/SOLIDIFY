import 'package:json_annotation/json_annotation.dart';

part 'chatbot_request_model.g.dart';

@JsonSerializable()
class ChatbotRequestModel {
  final Prompt prompt;
  final String? history;

  ChatbotRequestModel({
    required this.prompt,
    this.history,
  });

  factory ChatbotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotRequestModelToJson(this);
}

@JsonSerializable()
class Prompt {
  final String text;

  Prompt({required this.text});

  factory Prompt.fromJson(Map<String, dynamic> json) => _$PromptFromJson(json);

  Map<String, dynamic> toJson() => _$PromptToJson(this);
}
