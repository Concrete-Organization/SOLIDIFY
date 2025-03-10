import 'package:json_annotation/json_annotation.dart';

part 'get_comments_response.g.dart';

@JsonSerializable()
class GetCommentsResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final CommentsModel model;

  GetCommentsResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommentsResponseToJson(this);
}

@JsonSerializable()
class CommentsModel {
  final List<CommentModel> items;
  final int itemsCount;
  final int itemsFrom;
  final int itemsTo;
  final int totalPages;

  CommentsModel({
    required this.items,
    required this.itemsCount,
    required this.itemsFrom,
    required this.itemsTo,
    required this.totalPages,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}

@JsonSerializable()
class CommentModel {
  final String creationDate;
  final String? content;
  final int likesCount;
  final List<ReplyModel> replies;
  final int id;
  final String engineerId;
  final String? engineerName;
  final String? profileImageUrl;

  CommentModel({
    required this.creationDate,
    this.content,
    required this.likesCount,
    required this.replies,
    required this.id,
    required this.engineerId,
    this.engineerName,
    this.profileImageUrl,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}

@JsonSerializable()
class ReplyModel {
  final String content;
  final String creationDate;
  final int likesCount;
  final int id;
  final String engineerId;
  final String engineerName;
  final String? profileImageUrl;

  ReplyModel({
    required this.content,
    required this.creationDate,
    required this.likesCount,
    required this.id,
    required this.engineerId,
    required this.engineerName,
    this.profileImageUrl,
  });

  factory ReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyModelToJson(this);
}
