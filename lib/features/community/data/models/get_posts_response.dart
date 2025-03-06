import 'package:json_annotation/json_annotation.dart';

part 'get_posts_response.g.dart';

@JsonSerializable()
class GetPostsResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final PostsModel model;

  GetPostsResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostsResponseToJson(this);
}

@JsonSerializable()
class PostsModel {
  final List<PostModel> items;
  final int itemsCount;
  final int itemsFrom;
  final int itemsTo;
  final int totalPages;

  PostsModel({
    required this.items,
    required this.itemsCount,
    required this.itemsFrom,
    required this.itemsTo,
    required this.totalPages,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}

@JsonSerializable()
class PostModel {
  final String creationDate;
  final String? content;
  final List<String> imageUris;
  final int likesCount;
  final int commentsCount;
  final int id;
  final String engineerId;
  final String? engineerName;
  final String? profileImageUrl;

  PostModel({
    required this.creationDate,
    this.content,
    required this.imageUris,
    required this.likesCount,
    required this.commentsCount,
    required this.id,
    required this.engineerId,
    this.engineerName,
    this.profileImageUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
