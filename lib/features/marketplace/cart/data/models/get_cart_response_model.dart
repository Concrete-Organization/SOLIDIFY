import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response_model.g.dart';

@JsonSerializable()
class GetCartResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final CartModel model;

  GetCartResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartResponseModelToJson(this);
}

@JsonSerializable()
class CartModel {
  final double totalPrice;
  final List<CartItemModel> items;

  CartModel({
    required this.totalPrice,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class CartItemModel {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String imageUri;

  CartItemModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.imageUri,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
