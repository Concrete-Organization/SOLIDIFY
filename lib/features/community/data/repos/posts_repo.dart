import 'package:dio/dio.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_request.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_response.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/data/models/post_models/like_post_response.dart';

class PostsRepo {
  final ApiService _apiService;

  PostsRepo(this._apiService);

  Future<ApiResult<GetPostsResponse>> getPosts({int page = 1}) async {
    try {
      final response = await _apiService.posts(page);
      response.model.items
          .sort((a, b) => b.creationDate.compareTo(a.creationDate));
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreatePostResponse>> createPost(
      CreatePostRequest createPostRequest) async {
    try {
      final formData = await createPostRequest.toFormData();
      final response = await _apiService.createPost(formData);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LikePostResponse>> likePost(int postId) async {
    try {
      final response = await _apiService.likePost(postId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LikePostResponse>> unlikePost(int postId) async {
    try {
      final response = await _apiService.deleteLikePost(postId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
