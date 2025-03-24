import 'package:json_annotation/json_annotation.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';

part 'product_list_response_model.g.dart';

@JsonSerializable()
class ProductListResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final ProductListModel model;

  ProductListResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListResponseModelToJson(this);
}

@JsonSerializable()
class ProductListModel {
  final List<Product> items;
  final int itemsCount;
  final int itemsFrom;
  final int itemsTo;
  final int totalPages;

  ProductListModel({
    required this.items,
    required this.itemsCount,
    required this.itemsFrom,
    required this.itemsTo,
    required this.totalPages,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final int measurement;
  final String imageUri;
  final int rate;
  final int discount;
  final String brandName;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.measurement,
    required this.imageUri,
    required this.rate,
    required this.discount,
    required this.brandName,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

extension ProductToEntity on Product {
  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        price: price,
        description: description,
        measurement: measurement,
        imageUri: imageUri,
        rate: rate,
        discount: discount,
        brandName: brandName,
      );
}
