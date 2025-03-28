// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatbotResponseModel _$ChatbotResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChatbotResponseModel(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageMetadata: json['usageMetadata'] == null
          ? null
          : UsageMetadata.fromJson(
              json['usageMetadata'] as Map<String, dynamic>),
      modelVersion: json['modelVersion'] as String?,
    );

Map<String, dynamic> _$ChatbotResponseModelToJson(
        ChatbotResponseModel instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'usageMetadata': instance.usageMetadata,
      'modelVersion': instance.modelVersion,
    };

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String,
      avgLogprobs: (json['avgLogprobs'] as num).toDouble(),
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'content': instance.content,
      'finishReason': instance.finishReason,
      'avgLogprobs': instance.avgLogprobs,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'parts': instance.parts,
      'role': instance.role,
    };

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      text: json['text'] as String,
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'text': instance.text,
    };

UsageMetadata _$UsageMetadataFromJson(Map<String, dynamic> json) =>
    UsageMetadata(
      promptTokenCount: (json['promptTokenCount'] as num).toInt(),
      candidatesTokenCount: (json['candidatesTokenCount'] as num).toInt(),
      totalTokenCount: (json['totalTokenCount'] as num).toInt(),
    );

Map<String, dynamic> _$UsageMetadataToJson(UsageMetadata instance) =>
    <String, dynamic>{
      'promptTokenCount': instance.promptTokenCount,
      'candidatesTokenCount': instance.candidatesTokenCount,
      'totalTokenCount': instance.totalTokenCount,
    };
