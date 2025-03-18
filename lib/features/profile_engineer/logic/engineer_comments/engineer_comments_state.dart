import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';

part 'engineer_comments_state.freezed.dart';

@freezed
class EngineerCommentsState with _$EngineerCommentsState {
  const factory EngineerCommentsState.initial() = _Initial;
  const factory EngineerCommentsState.loading() = _Loading;
  const factory EngineerCommentsState.success(
      List<CommentModel> comments,
      bool hasMore,
      ) = _Success;
  const factory EngineerCommentsState.error(ApiErrorModel error) = _Error;
}