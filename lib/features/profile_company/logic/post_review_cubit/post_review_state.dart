import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/profile_company/data/models/post_review_response_model.dart';

part 'post_review_state.freezed.dart';

@freezed
class PostReviewState with _$PostReviewState {
  const factory PostReviewState.initial() = _Initial;

  const factory PostReviewState.loading() = _Loading;

  const factory PostReviewState.success({
    required PostReviewResponseModel response,
  }) = _Success;

  const factory PostReviewState.error({
    required ApiErrorModel error,
  }) = _Error;
}
