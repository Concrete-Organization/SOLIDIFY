import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/data/models/post_cart_response_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = CartLoading;
  const factory CartState.success(PostCartResponseModel response) = CartSuccess;
  const factory CartState.error({required ApiErrorModel error}) = CartError;
}
