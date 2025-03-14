// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsResponse _$GetPostsResponseFromJson(Map<String, dynamic> json) =>
    GetPostsResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: PostsModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPostsResponseToJson(GetPostsResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['itemsCount'] as num).toInt(),
      itemsFrom: (json['itemsFrom'] as num).toInt(),
      itemsTo: (json['itemsTo'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'itemsCount': instance.itemsCount,
      'itemsFrom': instance.itemsFrom,
      'itemsTo': instance.itemsTo,
      'totalPages': instance.totalPages,
    };

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      creationDate: json['creationDate'] as String,
      content: json['content'] as String?,
      imageUris:
          (json['imageUris'] as List<dynamic>).map((e) => e as String).toList(),
      likesCount: (json['likesCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      engineerId: json['engineerId'] as String,
      engineerName: json['engineerName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'creationDate': instance.creationDate,
      'content': instance.content,
      'imageUris': instance.imageUris,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'id': instance.id,
      'engineerId': instance.engineerId,
      'engineerName': instance.engineerName,
      'profileImageUrl': instance.profileImageUrl,
      'isLiked': instance.isLiked,
    };
