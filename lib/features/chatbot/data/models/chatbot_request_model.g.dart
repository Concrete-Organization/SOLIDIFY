// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatbotRequestModel _$ChatbotRequestModelFromJson(Map<String, dynamic> json) =>
    ChatbotRequestModel(
      prompt: Prompt.fromJson(json['prompt'] as Map<String, dynamic>),
      history: json['history'] as String?,
    );

Map<String, dynamic> _$ChatbotRequestModelToJson(
        ChatbotRequestModel instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'history': instance.history,
    };

Prompt _$PromptFromJson(Map<String, dynamic> json) => Prompt(
      text: json['text'] as String,
    );

Map<String, dynamic> _$PromptToJson(Prompt instance) => <String, dynamic>{
      'text': instance.text,
    };
