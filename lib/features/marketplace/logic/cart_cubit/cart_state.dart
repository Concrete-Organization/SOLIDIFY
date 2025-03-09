import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading(String productId) = CartLoading;
  const factory CartState.success(String productId) = CartSuccess;
  const factory CartState.error({
    required String productId,
    required ApiErrorModel error,
  }) = CartError;
}
