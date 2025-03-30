import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/order/data/models/order_response_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.success({
    required OrderResponseModel response,
  }) = _Success;
  const factory OrderState.error({
    required ApiErrorModel error,
  }) = _Error;
}
