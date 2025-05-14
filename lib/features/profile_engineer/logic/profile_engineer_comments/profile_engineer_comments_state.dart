import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/profile_engineer/data/models/comment_with_post.dart';

part 'profile_engineer_comments_state.freezed.dart';

@freezed
class ProfileEngineerCommentsState with _$ProfileEngineerCommentsState {
  const factory ProfileEngineerCommentsState.initial() = _Initial;

  const factory ProfileEngineerCommentsState.loading() = _Loading;

  const factory ProfileEngineerCommentsState.success(
    List<CommentWithPost> comments,
    bool hasMore,
  ) = _Success;

  const factory ProfileEngineerCommentsState.error(ApiErrorModel error) =
      _Error;
}
