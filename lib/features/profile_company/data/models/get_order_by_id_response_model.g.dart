// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_by_id_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderByIdResponseModel _$GetOrderByIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetOrderByIdResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: OrderModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrderByIdResponseModelToJson(
        GetOrderByIdResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderStatus: (json['orderStatus'] as num).toInt(),
      orderDate: OrderModel._dateTimeFromJson(json['orderDate'] as String),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItemDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingAddress: ShippingAddressRequestModel.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalPrice': instance.totalPrice,
      'orderStatus': instance.orderStatus,
      'orderDate': OrderModel._dateTimeToJson(instance.orderDate),
      'orderItems': instance.orderItems,
      'shippingAddress': instance.shippingAddress,
    };

OrderItemDetails _$OrderItemDetailsFromJson(Map<String, dynamic> json) =>
    OrderItemDetails(
      productId: json['productId'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemDetailsToJson(OrderItemDetails instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
    };
