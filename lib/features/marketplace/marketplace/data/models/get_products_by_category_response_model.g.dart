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
      result: ProductResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'result': instance.result,
    };

ProductResult _$ProductResultFromJson(Map<String, dynamic> json) =>
    ProductResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['itemsCount'] as num).toInt(),
      itemsFrom: (json['itemsFrom'] as num).toInt(),
      itemsTo: (json['itemsTo'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$ProductResultToJson(ProductResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'itemsCount': instance.itemsCount,
      'itemsFrom': instance.itemsFrom,
      'itemsTo': instance.itemsTo,
      'totalPages': instance.totalPages,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      measurement: json['measurement'] as String,
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
