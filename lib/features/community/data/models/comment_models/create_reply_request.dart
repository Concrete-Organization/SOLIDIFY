import 'package:json_annotation/json_annotation.dart';

part 'create_reply_request.g.dart';

@JsonSerializable()
class CreateReplyRequest {
  final String content;

  CreateReplyRequest({
    required this.content,
  });

  factory CreateReplyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReplyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReplyRequestToJson(this);
}