import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/data/repos/comments_repo.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/profile_engineer/data/models/comment_with_post.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_state.dart';

class ProfileEngineerCommentsCubit extends Cubit<ProfileEngineerCommentsState> {
  final PostsRepo _postsRepo;
  final CommentsRepo _commentsRepo;
  List<CommentWithPost> _allUserComments = [];
  int _currentPostPage = 1;
  bool _hasMorePosts = true;
  String? _engineerId;

  ProfileEngineerCommentsCubit(this._postsRepo, this._commentsRepo)
      : super(const ProfileEngineerCommentsState.initial());

  Future<void> fetchEngineerComments(String engineerId) async {
    _engineerId = engineerId;
    _currentPostPage = 1;
    _allUserComments = [];
    emit(const ProfileEngineerCommentsState.loading());
    await _loadComments();
  }

  Future<void> loadMoreComments() async {
    if (_hasMorePosts) {
      _currentPostPage++;
      emit(ProfileEngineerCommentsState.success(_allUserComments, true));
      await _loadComments(isLoadingMore: true);
    }
  }

  Future<void> _loadComments({bool isLoadingMore = false}) async {
    final postsResult = await _postsRepo.getPosts(page: _currentPostPage);

    postsResult.when(
      success: (postsData) async {
        final posts = postsData.model.items;
        List<CommentWithPost> newUserComments = [];

        for (var post in posts) {
          final commentsResult = await _commentsRepo.getComments(post.id, page: 1);

          commentsResult.when(
            success: (commentsData) {
              final userComments = commentsData.model.items
                  .where((c) => c.engineerId == _engineerId)
                  .map((comment) => CommentWithPost(comment: comment, post: post))
                  .toList();

              newUserComments.addAll(userComments);
            },
            failure: (error) {
              // Handle error silently
            },
          );
        }

        if (isLoadingMore) {
          _allUserComments = [..._allUserComments, ...newUserComments];
        } else {
          _allUserComments = newUserComments;
        }

        _allUserComments.sort((a, b) => b.comment.creationDate.compareTo(a.comment.creationDate));
        _hasMorePosts = _currentPostPage < postsData.model.totalPages;

        emit(ProfileEngineerCommentsState.success(_allUserComments, _hasMorePosts));
      },
      failure: (error) {
        emit(ProfileEngineerCommentsState.error(error));
      },
    );
  }
}