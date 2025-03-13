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
  bool isLiked;

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
    this.isLiked = false,
  });

  PostModel copyWith({
    String? creationDate,
    String? content,
    List<String>? imageUris,
    int? commentsCount,
    String? engineerId,
    int? id,
    String? engineerName,
    int? likesCount,
    bool? isLiked,
    String? profileImageUrl,

  }) {
    return PostModel(
      id: id ?? this.id,
      content: content ?? this.content,
      likesCount: likesCount ?? this.likesCount,
      isLiked: isLiked ?? this.isLiked,
      creationDate: creationDate ?? this.creationDate,
      imageUris: imageUris ?? this.imageUris,
      commentsCount: commentsCount ?? this.commentsCount,
      engineerId: engineerId ?? this.engineerId,
      engineerName: engineerName ?? this.engineerName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json)..isLiked = false;

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

}
