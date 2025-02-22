// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListResponseModel _$ProductListResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductListResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: ProductListModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductListResponseModelToJson(
        ProductListResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['itemsCount'] as num).toInt(),
      itemsFrom: (json['itemsFrom'] as num).toInt(),
      itemsTo: (json['itemsTo'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'itemsCount': instance.itemsCount,
      'itemsFrom': instance.itemsFrom,
      'itemsTo': instance.itemsTo,
      'totalPages': instance.totalPages,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      measurement: (json['measurement'] as num).toInt(),
      imageUri: json['imageUri'] as String,
      rate: (json['rate'] as num).toInt(),
      brandName: json['brandName'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'measurement': instance.measurement,
      'imageUri': instance.imageUri,
      'rate': instance.rate,
      'brandName': instance.brandName,
    };
