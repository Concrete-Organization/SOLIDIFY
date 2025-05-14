import 'package:json_annotation/json_annotation.dart';

part 'chatbot_response_model.g.dart';

@JsonSerializable()
class ChatbotResponseModel {
  final List<Candidate> candidates;
  final UsageMetadata? usageMetadata;
  final String? modelVersion;

  ChatbotResponseModel({
    required this.candidates,
    this.usageMetadata,
    this.modelVersion,
  });

  factory ChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotResponseModelToJson(this);
}

@JsonSerializable()
class Candidate {
  final Content content;
  final String finishReason;
  final double avgLogprobs;

  Candidate({
    required this.content,
    required this.finishReason,
    required this.avgLogprobs,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);

  /// Convenience getter to retrieve the candidate's output text.
  String get output => content.parts.isNotEmpty ? content.parts.first.text : '';
}

@JsonSerializable()
class Content {
  final List<Part> parts;
  final String role;

  Content({
    required this.parts,
    required this.role,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Part {
  final String text;

  Part({required this.text});

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}

@JsonSerializable()
class UsageMetadata {
  final int promptTokenCount;
  final int candidatesTokenCount;
  final int totalTokenCount;

  UsageMetadata({
    required this.promptTokenCount,
    required this.candidatesTokenCount,
    required this.totalTokenCount,
  });

  factory UsageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UsageMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$UsageMetadataToJson(this);
}
