import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_response.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState<T> with _$CommentsState<T> {
  const factory CommentsState.initial() = _Initial;

  const factory CommentsState.commentsLoading() = CommentsLoading;

  const factory CommentsState.commentsSuccess(List<CommentModel> comments) =
  CommentsSuccess<T>;

  const factory CommentsState.commentsError({required ApiErrorModel error}) =
  CommentsError;

  const factory CommentsState.createCommentLoading() = CreateCommentLoading;
  const factory CommentsState.createCommentSuccess(
      CreateCommentResponse response) = CreateCommentSuccess;
  const factory CommentsState.createCommentError(
      {required ApiErrorModel error}) = CreateCommentError;
}
