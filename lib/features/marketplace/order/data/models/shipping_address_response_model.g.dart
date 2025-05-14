// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressModel _$ShippingAddressModelFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressModel(
      id: (json['id'] as num).toInt(),
      city: json['city'] as String,
      street: json['street'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$ShippingAddressModelToJson(
        ShippingAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'street': instance.street,
      'postalCode': instance.postalCode,
    };

ShippingAddressResponseModel _$ShippingAddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model:
          ShippingAddressModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingAddressResponseModelToJson(
        ShippingAddressResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };
