// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderResponseModel _$GetOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetOrderResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: OrderModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrderResponseModelToJson(
        GetOrderResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['itemsCount'] as num).toInt(),
      itemsFrom: (json['itemsFrom'] as num).toInt(),
      itemsTo: (json['itemsTo'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'itemsCount': instance.itemsCount,
      'itemsFrom': instance.itemsFrom,
      'itemsTo': instance.itemsTo,
      'totalPages': instance.totalPages,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderStatus: (json['orderStatus'] as num).toInt(),
      orderDate: DateTime.parse(json['orderDate'] as String),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'totalPrice': instance.totalPrice,
      'orderStatus': instance.orderStatus,
      'orderDate': instance.orderDate.toIso8601String(),
    };
