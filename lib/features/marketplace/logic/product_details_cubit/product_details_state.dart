import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/data/models/get_product_by_id_response_body.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading(String productId) = DetailsLoading;
  const factory ProductDetailsState.success(ProductModel product) =
      DetailsSuccess;
  const factory ProductDetailsState.error({
    required String productId,
    required ApiErrorModel error,
  }) = DetailsError;
}
