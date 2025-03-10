// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentsResponse _$GetCommentsResponseFromJson(Map<String, dynamic> json) =>
    GetCommentsResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: CommentsModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCommentsResponseToJson(
        GetCommentsResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['itemsCount'] as num).toInt(),
      itemsFrom: (json['itemsFrom'] as num).toInt(),
      itemsTo: (json['itemsTo'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'itemsCount': instance.itemsCount,
      'itemsFrom': instance.itemsFrom,
      'itemsTo': instance.itemsTo,
      'totalPages': instance.totalPages,
    };

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      creationDate: json['creationDate'] as String,
      content: json['content'] as String?,
      replies: (json['replies'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      likesCount: (json['likesCount'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      engineerId: json['engineerId'] as String,
      engineerName: json['engineerName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'creationDate': instance.creationDate,
      'content': instance.content,
      'replies': instance.replies,
      'likesCount': instance.likesCount,
      'id': instance.id,
      'engineerId': instance.engineerId,
      'engineerName': instance.engineerName,
      'profileImageUrl': instance.profileImageUrl,
    };
