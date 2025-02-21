import 'package:json_annotation/json_annotation.dart';

part 'chatbot_response_model.g.dart';

@JsonSerializable()
class ChatbotResponseModel {
  final List<Candidate> candidates;

  ChatbotResponseModel({required this.candidates});

  factory ChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotResponseModelToJson(this);
}

@JsonSerializable()
class Candidate {
  final String output;

  Candidate({required this.output});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
