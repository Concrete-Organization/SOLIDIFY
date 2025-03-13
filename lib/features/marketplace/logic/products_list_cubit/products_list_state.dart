import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';

part 'products_list_state.freezed.dart';

@freezed
class ProductsListState<T> with _$ProductsListState<T> {
  const factory ProductsListState.initial() = _Initial;

  const factory ProductsListState.productsListLoading() = ProductsListLoading;

  const factory ProductsListState.productsListSuccess(
      List<Product> productsList) = ProductsListSuccess<T>;

  const factory ProductsListState.productsListError(
      {required ApiErrorModel error}) = ProductsListError;
}
