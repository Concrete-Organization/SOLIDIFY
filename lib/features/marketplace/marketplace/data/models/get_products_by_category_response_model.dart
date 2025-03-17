import 'package:json_annotation/json_annotation.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';

part 'get_products_by_category_response_model.g.dart';

@JsonSerializable()
class GetProductsByCategoryResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final ProductCategoryModel model;

  GetProductsByCategoryResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetProductsByCategoryResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetProductsByCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetProductsByCategoryResponseModelToJson(this);
}

@JsonSerializable()
class ProductCategoryModel {
  final String name;
  final ProductResult result;

  ProductCategoryModel({
    required this.name,
    required this.result,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}

@JsonSerializable()
class ProductResult {
  final List<ProductModel> items;
  final int itemsCount;
  final int itemsFrom;
  final int itemsTo;
  final int totalPages;

  ProductResult({
    required this.items,
    required this.itemsCount,
    required this.itemsFrom,
    required this.itemsTo,
    required this.totalPages,
  });

  factory ProductResult.fromJson(Map<String, dynamic> json) =>
      _$ProductResultFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResultToJson(this);
}

@JsonSerializable()
class ProductModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final int measurement;
  final String imageUri;
  final int rate;
  final int discount;
  final String? brandName;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.measurement,
    required this.imageUri,
    required this.rate,
    required this.discount,
    this.brandName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

extension ProductModelToEntity on ProductModel {
  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        price: price,
        description: description,
        measurement: measurement,
        imageUri: imageUri,
        rate: rate,
        discount: discount,
        brandName: brandName ?? '',
      );
}
