import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.success(ProductListResponseModel response) =
      _Success;
  const factory SearchState.error(ApiErrorModel error) = _Error;
  const factory SearchState.empty() = _Empty;
}
