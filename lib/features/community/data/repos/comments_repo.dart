import 'package:dio/dio.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_response.dart';
import 'package:solidify/features/community/data/models/comment_models/create_reply_request.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/data/models/post_models/like_post_response.dart';

class CommentsRepo {
  final ApiService _apiService;

  CommentsRepo(this._apiService);

  Future<ApiResult<GetCommentsResponse>> getComments(int postId,
      {int page = 1}) async {
    try {
      final accessToken =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
      final response = await _apiService.comments(postId, page, accessToken);
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
      final response =
          await _apiService.createComment(postId, createCommentRequest);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreateCommentResponse>> reply(
      int commentId,
      CreateReplyRequest replyRequest,
      ) async {
    try {
      final response = await _apiService.reply(commentId, replyRequest);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LikePostResponse>> likeComment(int commentId) async {
    try {
      final response = await _apiService.likeComment(commentId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LikePostResponse>> unlikeComment(int commentId) async {
    try {
      final response = await _apiService.deleteLikeComment(commentId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LikePostResponse>> likeReply(int replyId) async {
    try {
      final response = await _apiService.likeReply(replyId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LikePostResponse>> unlikeReply(int replyId) async {
    try {
      final response = await _apiService.deleteLikeReply(replyId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
