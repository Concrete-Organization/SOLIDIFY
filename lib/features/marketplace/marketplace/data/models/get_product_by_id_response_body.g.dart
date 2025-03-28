// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_by_id_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductByIdResponseBody _$GetProductByIdResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GetProductByIdResponseBody(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: ProductModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductByIdResponseBodyToJson(
        GetProductByIdResponseBody instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      measurement: (json['measurement'] as num).toInt(),
      imageUri: json['imageUri'] as String,
      rate: (json['rate'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      brandName: json['brandName'] as String?,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'measurement': instance.measurement,
      'imageUri': instance.imageUri,
      'rate': instance.rate,
      'discount': instance.discount,
      'brandName': instance.brandName,
      'reviews': instance.reviews,
      'reviewsCount': instance.reviewsCount,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: json['id'] as String,
      message: json['message'] as String,
      userRate: (json['userRate'] as num).toInt(),
      concreteCompanyId: json['concreteCompanyId'] as String,
      companyName: json['companyName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'userRate': instance.userRate,
      'concreteCompanyId': instance.concreteCompanyId,
      'companyName': instance.companyName,
      'profileImageUrl': instance.profileImageUrl,
    };
