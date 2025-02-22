// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatbotRequestModel _$ChatbotRequestModelFromJson(Map<String, dynamic> json) =>
    ChatbotRequestModel(
      contents: (json['contents'] as List<dynamic>)
          .map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatbotRequestModelToJson(
        ChatbotRequestModel instance) =>
    <String, dynamic>{
      'contents': instance.contents,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'parts': instance.parts,
    };

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      text: json['text'] as String,
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'text': instance.text,
    };
