import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/profile_company/data/models/post_review_request_model.dart'; // As specified
import 'package:solidify/features/profile_company/data/models/post_review_response_model.dart'; // Assumed response model

class ReviewsRepo {
  final ApiService _apiService;

  ReviewsRepo(this._apiService);

  Future<ApiResult<PostReviewResponseModel>> postReview(
    String productId,
    PostReviewRequestModel request,
    String token,
  ) async {
    try {
      final response = await _apiService.postReview(productId, request, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
