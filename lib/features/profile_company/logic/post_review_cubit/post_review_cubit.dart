import 'post_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/profile_company/data/repos/reviews_repo.dart';
import 'package:solidify/features/profile_company/data/models/post_review_request_model.dart';

class PostReviewCubit extends Cubit<PostReviewState> {
  final ReviewsRepo _reviewsRepo;

  PostReviewCubit(this._reviewsRepo) : super(const PostReviewState.initial());

  Future<void> postReview({
    required String productId,
    required String message,
    required int userRate,
  }) async {
    emit(const PostReviewState.loading());

    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
    if (token.isEmpty) {
      emit(PostReviewState.error(
        error: ApiErrorModel(message: 'No authentication token found'),
      ));
      return;
    }

    final request = PostReviewRequestModel(
      message: message,
      userRate: userRate,
    );

    final response = await _reviewsRepo.postReview(productId, request, token);

    response.when(
      success: (response) {
        if (response.isSucceeded) {
          emit(PostReviewState.success(response: response));
        } else {
          emit(PostReviewState.error(
            error: ApiErrorModel(message: response.message),
          ));
        }
      },
      failure: (error) {
        emit(PostReviewState.error(error: error));
      },
    );
  }
}
