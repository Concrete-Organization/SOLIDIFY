import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/profile_company/data/models/get_order_by_id_response_model.dart';

part 'order_details_state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;

  const factory OrderDetailsState.loading() = _Loading;

  const factory OrderDetailsState.success({
    required GetOrderByIdResponseModel response,
  }) = _Success;

  const factory OrderDetailsState.error({
    required ApiErrorModel error,
  }) = _Error;

  const factory OrderDetailsState.canceled() = _Canceled;
}
