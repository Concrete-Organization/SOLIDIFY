import 'package:json_annotation/json_annotation.dart';

part 'get_order_response_model.g.dart';

@JsonSerializable()
class GetOrderResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final OrderModel model;

  GetOrderResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderResponseModelToJson(this);
}

@JsonSerializable()
class OrderModel {
  final List<OrderItem> items;
  final int itemsCount;
  final int itemsFrom;
  final int itemsTo;
  final int totalPages;

  OrderModel({
    required this.items,
    required this.itemsCount,
    required this.itemsFrom,
    required this.itemsTo,
    required this.totalPages,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderItem {
  final String id;
  final double totalPrice;
  final int orderStatus;
  final DateTime orderDate;

  OrderItem({
    required this.id,
    required this.totalPrice,
    required this.orderStatus,
    required this.orderDate,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
