import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/community/data/models/comment_models/create_reply_request.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/data/repos/comments_repo.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepo _commentsRepo;
  List<CommentModel> _allComments = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _hasMoreComments = true;
  Set<int> _likedComments = {};
  Set<int> _likedReplies = {};

  CommentsCubit(this._commentsRepo) : super(const CommentsState.initial()) {
    _initializeLikedData();
  }

  Future<void> _initializeLikedData() async {
    _likedComments = await SharedPrefHelper.getLikedComments();
    _likedReplies = await SharedPrefHelper.getLikedReplies();
  }
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
        final serverLikedComments = data.model.items
            .where((comment) => comment.isLiked)
            .map((c) => c.id)
            .toSet();

        final serverLikedReplies = data.model.items
            .expand((comment) => comment.replies)
            .where((reply) => reply.isLiked)
            .map((r) => r.id)
            .toSet();

        _likedComments.addAll(serverLikedComments);
        _likedReplies.addAll(serverLikedReplies);

        SharedPrefHelper.updateLikedComments(_likedComments);
        SharedPrefHelper.updateLikedReplies(_likedReplies);

        _allComments = data.model.items.map((comment) {
          final updatedReplies = comment.replies.map((reply) {
            return reply.copyWith(isLiked: _likedReplies.contains(reply.id));
          }).toList();

          return comment.copyWith(
            isLiked: _likedComments.contains(comment.id),
            replies: updatedReplies,
          );
        }).toList();

        _totalPages = data.model.totalPages;
        _hasMoreComments = _currentPage < _totalPages;

        emit(CommentsState.commentsSuccess(
          comments: _allComments,
          replyingToComment: null,
        ));
      },
      failure: (error) {
        emit(CommentsState.commentsError(error: error));
      },
    );
  }

  Future<void> loadMoreComments(int postId) async {
    if (state is CommentsSuccess &&
        _hasMoreComments &&
        _currentPage < _totalPages) {
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

        emit(CommentsState.commentsSuccess(comments: _allComments));
      },
      failure: (error) {
        if (isLoadingMore) {
          _currentPage--;
        }
        emit(CommentsState.commentsError(error: error));
      },
    );
  }

  Future<void> createComment(
      CreateCommentRequest requestModel, int postId) async {
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

  void setReplyingToComment(CommentModel? comment) {
    if (state is CommentsSuccess) {
      final currentState = state as CommentsSuccess;
      emit(currentState.copyWith(replyingToComment: comment));
    }
  }

  Future<void> createReply(
      CreateReplyRequest request,
      int commentId,
      int postId,
      ) async {
    emit(const CommentsState.createCommentLoading());
    final result = await _commentsRepo.reply(commentId, request);

    result.when(
      success: (data) {
        fetchComments(postId, refresh: true);
        setReplyingToComment(null);
        emit(CommentsState.createCommentSuccess(data));
      },
      failure: (error) {
        emit(CommentsState.createCommentError(error: error));
      },
    );
  }

  Future<void> likeComment(int commentId) async {
    try {
      _updateLocalLikeForComment(commentId, true);
      await SharedPrefHelper.addLikedComment(commentId);
      await _commentsRepo.likeComment(commentId);
    } catch (error) {
      _updateLocalLikeForComment(commentId, false);
      await SharedPrefHelper.removeLikedComment(commentId);
    }
  }

  Future<void> unlikeComment(int commentId) async {
    try {
      _updateLocalLikeForComment(commentId, false);
      await SharedPrefHelper.removeLikedComment(commentId);
      await _commentsRepo.unlikeComment(commentId);
    } catch (error) {
      _updateLocalLikeForComment(commentId, true);
      await SharedPrefHelper.addLikedComment(commentId);
    }
  }

  Future<void> likeReply(int replyId) async {
    try {
      _updateLocalLikeForReply(replyId, true);
      await SharedPrefHelper.addLikedReply(replyId);
      await _commentsRepo.likeReply(replyId);
    } catch (error) {
      _updateLocalLikeForReply(replyId, false);
      await SharedPrefHelper.removeLikedReply(replyId);
    }
  }

  Future<void> unlikeReply(int replyId) async {
    try {
      _updateLocalLikeForReply(replyId, false);
      await SharedPrefHelper.removeLikedReply(replyId);
      await _commentsRepo.unlikeReply(replyId);
    } catch (error) {
      _updateLocalLikeForReply(replyId, true);
      await SharedPrefHelper.addLikedReply(replyId);
    }
  }

  void _updateLocalLikeForComment(int commentId, bool isLiked) {
    _allComments = _allComments.map((comment) {
      if (comment.id == commentId) {
        return comment.copyWith(
          isLiked: isLiked,
          likesCount: isLiked ? comment.likesCount + 1 : comment.likesCount - 1,
        );
      }
      return comment;
    }).toList();

    _emitUpdatedState();
  }

  void _updateLocalLikeForReply(int replyId, bool isLiked) {
    _allComments = _allComments.map((comment) {
      final updatedReplies = comment.replies.map((reply) {
        if (reply.id == replyId) {
          return reply.copyWith(
            isLiked: isLiked,
            likesCount: isLiked ? reply.likesCount + 1 : reply.likesCount - 1,
          );
        }
        return reply;
      }).toList();

      return comment.copyWith(replies: updatedReplies);
    }).toList();

    _emitUpdatedState();
  }

  void _emitUpdatedState() {
    if (state is CommentsSuccess) {
      emit(CommentsState.commentsSuccess(
        comments: _allComments,
        replyingToComment: (state as CommentsSuccess).replyingToComment,
      ));
    }
  }
}