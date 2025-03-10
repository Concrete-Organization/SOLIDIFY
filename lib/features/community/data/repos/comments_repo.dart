import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';

class CommentsRepo {
  final ApiService _apiService;

  CommentsRepo(this._apiService);

  Future<ApiResult<GetCommentsResponse>> getComments(int postId) async {
    try {
      final accessToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
      final response = await _apiService.comments(postId,accessToken);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}