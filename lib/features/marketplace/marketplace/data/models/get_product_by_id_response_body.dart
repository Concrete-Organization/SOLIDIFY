import 'package:json_annotation/json_annotation.dart';

part 'get_product_by_id_response_body.g.dart';

@JsonSerializable()
class GetProductByIdResponseBody {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final ProductModel model;

  GetProductByIdResponseBody({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory GetProductByIdResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetProductByIdResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductByIdResponseBodyToJson(this);
}

@JsonSerializable()
class ProductModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final String measurement;
  final String imageUri;
  final int rate;
  final int discount;
  final String? brandName;
  final List<ReviewModel> reviews;
  final int reviewsCount;

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
    required this.reviews,
    required this.reviewsCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  final String id;
  final String message;
  final int userRate;
  final String concreteCompanyId;
  final String companyName;
  final String? profileImageUrl;

  ReviewModel({
    required this.id,
    required this.message,
    required this.userRate,
    required this.concreteCompanyId,
    required this.companyName,
    this.profileImageUrl,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
