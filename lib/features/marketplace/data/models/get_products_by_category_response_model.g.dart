// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_by_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsByCategoryResponseModel _$GetProductsByCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsByCategoryResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model:
          ProductCategoryModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductsByCategoryResponseModelToJson(
        GetProductsByCategoryResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      name: json['name'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'products': instance.products,
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
    };
