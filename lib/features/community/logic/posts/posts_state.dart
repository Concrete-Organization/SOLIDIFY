import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_response.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState<T> with _$PostsState<T> {
  const factory PostsState.initial() = _Initial;

  const factory PostsState.postsLoading() = PostsLoading;

  const factory PostsState.postsSuccess({
    required List<PostModel> posts,
    required bool hasMorePosts,
    required int currentPage,
    required int totalPages,
  }) = PostsSuccess;

  const factory PostsState.loadingMorePosts({
    required List<PostModel> currentPosts,
    required int currentPage,
  }) = LoadingMorePosts;

  const factory PostsState.postsError({required ApiErrorModel error}) = PostsError;
  const factory PostsState.createPostLoading() = CreatePostLoading;
  const factory PostsState.createPostSuccess(
      CreatePostResponse response) = CreatePostSuccess;
  const factory PostsState.createPostError(
      {required ApiErrorModel error}) = CreatePostError;
}