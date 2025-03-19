import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';

part 'profile_engineer_posts_state.freezed.dart';

@freezed
class ProfileEngineerPostsState with _$ProfileEngineerPostsState {
  const factory ProfileEngineerPostsState.initial() = _Initial;
  const factory ProfileEngineerPostsState.loading() = _Loading;
  const factory ProfileEngineerPostsState.success(List<PostModel> posts) = _Success;
  const factory ProfileEngineerPostsState.error(ApiErrorModel error) = _Error;
}