import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/community/data/models/get_posts_response.dart';

class PostsRepo {
  final ApiService _apiService;

  PostsRepo(this._apiService);

  Future<ApiResult<GetPostsResponse>> getPosts() async {
    try {
      final response = await _apiService.posts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}