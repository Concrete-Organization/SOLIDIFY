import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';

part 'engineer_posts_state.freezed.dart';

@freezed
class EngineerPostsState with _$EngineerPostsState {
  const factory EngineerPostsState.initial() = _Initial;
  const factory EngineerPostsState.loading() = _Loading;
  const factory EngineerPostsState.success(List<PostModel> posts) = _Success;
  const factory EngineerPostsState.error(ApiErrorModel error) = _Error;
}