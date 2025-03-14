import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';

part 'product_category_state.freezed.dart';

@freezed
class ProductCategoryState with _$ProductCategoryState {
  const factory ProductCategoryState.initial() = _Initial;
  const factory ProductCategoryState.categoryLoading() = CategoryLoading;
  const factory ProductCategoryState.categorySuccess(
    GetProductsByCategoryResponseModel response,
    List<String> cachedProductIds,
  ) = CategorySuccess;
  const factory ProductCategoryState.categoryError({
    required ApiErrorModel error,
  }) = CategoryError;
}
