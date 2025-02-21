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
    );

Map<String, dynamic> _$ChatbotResponseModelToJson(
        ChatbotResponseModel instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      output: json['output'] as String,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'output': instance.output,
    };
