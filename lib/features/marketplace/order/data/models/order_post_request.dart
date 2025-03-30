import 'package:json_annotation/json_annotation.dart';

part 'order_post_request.g.dart';

@JsonSerializable()
class OrderPostRequest {
  @JsonKey(name: 'shippingAddressId')
  final int shippingAddressId;

  OrderPostRequest({required this.shippingAddressId});

  factory OrderPostRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPostRequestToJson(this);
}
