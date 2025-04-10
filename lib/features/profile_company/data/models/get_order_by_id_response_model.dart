import 'package:json_annotation/json_annotation.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_request_model.dart';

part 'get_order_by_id_response_model.g.dart';

@JsonSerializable()
class GetOrderByIdResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final OrderModel model;

  GetOrderByIdResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetOrderByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrderByIdResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderByIdResponseModelToJson(this);
}

// Order model
@JsonSerializable()
class OrderModel {
  final String id;
  final double totalPrice;
  final int orderStatus;
  final String orderDate;
  final List<OrderItemDetails> orderItems;
  final ShippingAddressRequestModel shippingAddress;

  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.orderStatus,
    required this.orderDate,
    required this.orderItems,
    required this.shippingAddress,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderItemDetails {
  final String productId;
  final String name;
  final int quantity;
  final double price;

  OrderItemDetails({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderItemDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemDetailsToJson(this);
}
