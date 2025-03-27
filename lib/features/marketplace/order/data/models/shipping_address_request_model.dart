import 'package:json_annotation/json_annotation.dart';

part 'shipping_address_request_model.g.dart';

@JsonSerializable()
class ShippingAddressRequestModel {
  final String city;
  final String street;
  final String postalCode;

  ShippingAddressRequestModel({
    required this.city,
    required this.street,
    required this.postalCode,
  });

  factory ShippingAddressRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressRequestModelToJson(this);
}
