import 'package:json_annotation/json_annotation.dart';

part 'shipping_address_response_model.g.dart';

@JsonSerializable()
class ShippingAddressModel {
  final int id;
  final String city;
  final String street;
  final String postalCode;

  ShippingAddressModel({
    required this.id,
    required this.city,
    required this.street,
    required this.postalCode,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressModelToJson(this);
}

@JsonSerializable()
class ShippingAddressResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final ShippingAddressModel model;

  ShippingAddressResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory ShippingAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressResponseModelToJson(this);
}
