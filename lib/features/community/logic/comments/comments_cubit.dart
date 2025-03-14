import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/data/repos/comments_repo.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepo _commentsRepo;
  List<CommentModel> _allComments = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _hasMoreComments = true;

  CommentsCubit(this._commentsRepo) : super(const CommentsState.initial());

  Future<void> fetchComments(int postId, {bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allComments = [];
      emit(const CommentsState.commentsLoading());
    } else if (state is CommentsSuccess && !_hasMoreComments) {
      return;
    } else {
      emit(const CommentsState.commentsLoading());
    }

    final result = await _commentsRepo.getComments(postId, page: _currentPage);

    result.when(
      success: (data) {
        _allComments = data.model.items;
        _totalPages = data.model.totalPages;
        _hasMoreComments = _currentPage < _totalPages;
        emit(CommentsState.commentsSuccess(_allComments));
      },
      failure: (error) {
        emit(CommentsState.commentsError(error: error));
      },
    );
  }
  Future<void> loadMoreComments(int postId) async {
    if (state is CommentsSuccess && _hasMoreComments && _currentPage < _totalPages) {
      _currentPage++;
      await _loadComments(postId, isLoadingMore: true);
    }
  }

  Future<void> _loadComments(int postId, {bool isLoadingMore = false}) async {
    final result = await _commentsRepo.getComments(postId, page: _currentPage);

    result.when(
      success: (data) {
        if (isLoadingMore) {
          _allComments = [..._allComments, ...data.model.items];
        } else {
          _allComments = data.model.items;
        }

        _totalPages = data.model.totalPages;
        _hasMoreComments = _currentPage < _totalPages;

        emit(CommentsState.commentsSuccess(_allComments));
      },
      failure: (error) {
        if (isLoadingMore) {
          _currentPage--;
        }
        emit(CommentsState.commentsError(error: error));
      },
    );
  }

  Future<void> createComment(CreateCommentRequest requestModel, int postId) async {
    emit(const CommentsState.createCommentLoading());
    final result = await _commentsRepo.createComment(requestModel, postId);

    result.when(
      success: (data) {
        fetchComments(postId, refresh: true);
        emit(CommentsState.createCommentSuccess(data));
      },
      failure: (error) {
        emit(CommentsState.createCommentError(error: error));
      },
    );
  }
}