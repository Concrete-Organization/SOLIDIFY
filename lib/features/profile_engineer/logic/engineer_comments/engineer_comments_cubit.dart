import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/data/repos/comments_repo.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_comments/engineer_comments_state.dart';

class EngineerCommentsCubit extends Cubit<EngineerCommentsState> {
  final PostsRepo _postsRepo;
  final CommentsRepo _commentsRepo;
  List<CommentModel> _allUserComments = [];
  int _currentPostPage = 1;
  bool _hasMorePosts = true;
  String? _engineerId;

  EngineerCommentsCubit(this._postsRepo, this._commentsRepo)
      : super(const EngineerCommentsState.initial());

  Future<void> fetchEngineerComments(String engineerId) async {
    _engineerId = engineerId;
    _currentPostPage = 1;
    _allUserComments = [];
    emit(const EngineerCommentsState.loading());
    await _loadComments();
  }

  Future<void> loadMoreComments() async {
    if (_hasMorePosts) {
      _currentPostPage++;
      emit(EngineerCommentsState.success(_allUserComments, true));
      await _loadComments(isLoadingMore: true);
    }
  }

  Future<void> _loadComments({bool isLoadingMore = false}) async {
    final postsResult = await _postsRepo.getPosts(page: _currentPostPage);

    postsResult.when(
      success: (postsData) async {
        final posts = postsData.model.items;
        List<CommentModel> newUserComments = [];

        final commentFutures =
        posts.map((post) => _commentsRepo.getComments(post.id, page: 1)).toList();
        final commentResults = await Future.wait(commentFutures);

        for (var result in commentResults) {
          result.when(
            success: (commentsData) {
              final userComments =
              commentsData.model.items.where((c) => c.engineerId == _engineerId).toList();
              newUserComments.addAll(userComments);
            },
            failure: (error) {
            },
          );
        }

        if (isLoadingMore) {
          _allUserComments = [..._allUserComments, ...newUserComments];
        } else {
          _allUserComments = newUserComments;
        }

        _allUserComments.sort((a, b) => b.creationDate.compareTo(a.creationDate));
        _hasMorePosts = _currentPostPage < postsData.model.totalPages;

        emit(EngineerCommentsState.success(_allUserComments, _hasMorePosts));
      },
      failure: (error) {
        emit(EngineerCommentsState.error(error));
      },
    );
  }
}