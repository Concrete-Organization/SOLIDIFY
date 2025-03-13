import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_request.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;
  List<PostModel> _allPosts = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _hasMorePosts = true;
  Set<int> _likedPosts = {};

  PostsCubit(this._postsRepo) : super(const PostsState.initial()) {
    _loadLikedPosts();
  }

  Future<void> _loadLikedPosts() async {
    _likedPosts = await SharedPrefHelper.getLikedPosts();
  }

  Future<void> fetchPosts({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allPosts = [];
      emit(const PostsState.postsLoading());
    } else if (state is PostsSuccess) {
      return;
    } else {
      emit(const PostsState.postsLoading());
    }

    await _loadPosts();
  }

  Future<void> loadMorePosts() async {
    if (state is PostsSuccess && _hasMorePosts && _currentPage < _totalPages) {
      emit(PostsState.loadingMorePosts(
        currentPosts: _allPosts,
        currentPage: _currentPage,
      ));

      _currentPage++;
      await _loadPosts(isLoadingMore: true);
    }
  }

  Future<void> _loadPosts({bool isLoadingMore = false}) async {
    final result = await _postsRepo.getPosts(
      page: _currentPage,
    );

    result.when(
      success: (data) {
        final newPosts = data.model.items.map((post) {
          return post.copyWith(
            isLiked: _likedPosts.contains(post.id),
          );
        }).toList();

        if (isLoadingMore) {
          _allPosts = [..._allPosts, ...newPosts];
        } else {
          _allPosts = newPosts;
        }

        _totalPages = data.model.totalPages;
        _hasMorePosts = _currentPage < _totalPages;

        emit(PostsState.postsSuccess(
          posts: _allPosts,
          hasMorePosts: _hasMorePosts,
          currentPage: _currentPage,
          totalPages: _totalPages,
        ));
      },
      failure: (error) {
        if (isLoadingMore) {
          _currentPage--;
        }
        emit(PostsState.postsError(error: error));
      },
    );
  }

  Future<void> createPost(CreatePostRequest requestModel) async {
    emit(const PostsState.createPostLoading());
    final result = await _postsRepo.createPost(requestModel);
    result.when(
      success: (data) async {
        _currentPage = 1;
        _allPosts = [];
        await _loadPosts();
        emit(PostsState.createPostSuccess(data));
      },
      failure: (error) {
        emit(PostsState.createPostError(error: error));
      },
    );
  }

  Future<void> likePost(int postId) async {
    try {
      if (_likedPosts.contains(postId)) {
        await unlikePost(postId);
        return;
      }

      _updateLocalLike(postId, true);
      await SharedPrefHelper.addLikedPost(postId);

      final result = await _postsRepo.likePost(postId);
      result.when(
        success: (_) {},
        failure: (error) async{
          // Rollback on error
          _updateLocalLike(postId, false);
          await SharedPrefHelper.removeLikedPost(postId);
        },
      );
    } catch (error) {
      _updateLocalLike(postId, false);
      await SharedPrefHelper.removeLikedPost(postId);
    }
  }

  Future<void> unlikePost(int postId) async {
    try {
      _updateLocalLike(postId, false);
      await SharedPrefHelper.removeLikedPost(postId);

      final result = await _postsRepo.unlikePost(postId);
      result.when(
        success: (_) {},
        failure: (error) async{
          _updateLocalLike(postId, true);
          await SharedPrefHelper.addLikedPost(postId);
        },
      );
    } catch (error) {
      _updateLocalLike(postId, true);
      await SharedPrefHelper.addLikedPost(postId);
    }
  }

  void _updateLocalLike(int postId, bool isLiked) {
    _allPosts = _allPosts.map((post) {
      if (post.id == postId) {
        return post.copyWith(
          isLiked: isLiked,
          likesCount: isLiked ? post.likesCount + 1 : post.likesCount - 1,
        );
      }
      return post;
    }).toList();

    if (isLiked) {
      _likedPosts.add(postId);
    } else {
      _likedPosts.remove(postId);
    }

    emit(PostsState.postsSuccess(
      posts: _allPosts,
      hasMorePosts: _hasMorePosts,
      currentPage: _currentPage,
      totalPages: _totalPages,
    ));
  }
}
