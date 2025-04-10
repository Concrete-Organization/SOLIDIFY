import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/order/data/models/order_response_model.dart';
import 'package:solidify/features/profile_company/data/models/get_order_response_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;

  // Create order states
  const factory OrderState.createLoading() = _CreateLoading;
  const factory OrderState.createSuccess({
    required OrderResponseModel response,
  }) = _CreateSuccess;
  const factory OrderState.createError({
    required ApiErrorModel error,
  }) = _CreateError;

  // Get orders states
  const factory OrderState.getOrdersLoading() = _GetOrdersLoading;
  const factory OrderState.getOrdersSuccess({
    required GetOrderResponseModel response,
  }) = _GetOrdersSuccess;
  const factory OrderState.getOrdersError({
    required ApiErrorModel error,
  }) = _GetOrdersError;
}
