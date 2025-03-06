import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/models/get_posts_response.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState<T> with _$PostsState<T> {
  const factory PostsState.initial() = _Initial;

  const factory PostsState.postsLoading() = PostsLoading;

  const factory PostsState.postsSuccess(List<PostModel> posts) =
      PostsSuccess<T>;

  const factory PostsState.postsError({required ApiErrorModel error}) =
      PostsError;
}
