import 'package:json_annotation/json_annotation.dart';

part 'chatbot_request_model.g.dart';

@JsonSerializable()
class ChatbotRequestModel {
  final List<Content> contents;

  ChatbotRequestModel({required this.contents});

  factory ChatbotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotRequestModelToJson(this);
}

@JsonSerializable()
class Content {
  final List<Part> parts;

  Content({required this.parts});

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
