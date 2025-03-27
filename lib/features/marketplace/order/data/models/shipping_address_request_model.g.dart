// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressRequestModel _$ShippingAddressRequestModelFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressRequestModel(
      city: json['city'] as String,
      street: json['street'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$ShippingAddressRequestModelToJson(
        ShippingAddressRequestModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'postalCode': instance.postalCode,
    };
