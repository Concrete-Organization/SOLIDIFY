// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPostRequest _$OrderPostRequestFromJson(Map<String, dynamic> json) =>
    OrderPostRequest(
      shippingAddressId: (json['shippingAddressId'] as num).toInt(),
    );

Map<String, dynamic> _$OrderPostRequestToJson(OrderPostRequest instance) =>
    <String, dynamic>{
      'shippingAddressId': instance.shippingAddressId,
    };
