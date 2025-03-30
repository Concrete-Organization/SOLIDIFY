import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_response_model.dart';

part 'shipping_address_state.freezed.dart';

@freezed
class ShippingAddressState with _$ShippingAddressState {
  const factory ShippingAddressState.initial() = _Initial;
  const factory ShippingAddressState.loading() = _Loading;
  const factory ShippingAddressState.success({
    required ShippingAddressResponseModel response,
  }) = _Success;
  const factory ShippingAddressState.error({
    required ApiErrorModel error,
  }) = _Error;
}
