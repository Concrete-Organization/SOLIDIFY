import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/data/repos/comments_repo.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepo _commentsRepo;

  CommentsCubit(this._commentsRepo) : super(const CommentsState.initial());

  Future<void> fetchComments(int postId) async {
    emit(const CommentsState.commentsLoading());

    final result = await _commentsRepo.getComments(postId);

    result.when(
      success: (data) {
        emit(CommentsState.commentsSuccess(data.model.items));
      },
      failure: (error) {
        emit(CommentsState.commentsError(error: error));
      },
    );
  }
}