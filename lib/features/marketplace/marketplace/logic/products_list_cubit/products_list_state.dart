import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';

part 'products_list_state.freezed.dart';

@freezed
class ProductsListState with _$ProductsListState {
  const factory ProductsListState.initial() = _Initial;
  const factory ProductsListState.loading(List<Product> products) =
      ProductsListLoading;
  const factory ProductsListState.marketplaceSuccess(List<Product> products) =
      MarketplaceSuccess;
  const factory ProductsListState.bestSellersSuccess(
      List<Product> products, bool hasReachedMax) = BestSellersSuccess;
  const factory ProductsListState.error(ApiErrorModel error) =
      ProductsListError;
  const factory ProductsListState.searchSuccess(List<Product> products) =
      SearchSuccess;
}
