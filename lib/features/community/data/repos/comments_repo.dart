import 'package:dio/dio.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_response.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';

class CommentsRepo {
  final ApiService _apiService;

  CommentsRepo(this._apiService);

  Future<ApiResult<GetCommentsResponse>> getComments(int postId) async {
    try {
      final response = await _apiService.comments(postId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreateCommentResponse>> createComment(
      CreateCommentRequest createCommentRequest,
      int postId,
      ) async {
    try {
      final response = await _apiService.createComment(postId, createCommentRequest);
      return ApiResult.success(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 302) {
        print('Redirected to: ${e.response?.headers['location']}');
        return ApiResult.failure(ApiErrorModel(message: 'Session expired, please log in again'));
      }
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}