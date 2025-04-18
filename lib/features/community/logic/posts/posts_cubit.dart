import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_request.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;
  List<PostModel> _allPosts = [];
  List<PostModel> _allUnfilteredPosts = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _hasMorePosts = true;
  Set<int> _likedPosts = {};
  String _currentSearchQuery = '';

  PostsCubit(this._postsRepo) : super(const PostsState.initial()) {
    _initializeLikedPosts();
  }

  Future<void> _initializeLikedPosts() async {
    _likedPosts = await SharedPrefHelper.getLikedPosts();
  }

  Future<void> fetchPosts({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allPosts = [];
      _allUnfilteredPosts = [];
      _currentSearchQuery = '';
      emit(const PostsState.postsLoading());
    } else if (state is PostsSuccess) {
      return;
    } else {
      emit(const PostsState.postsLoading());
    }

    await loadPosts();
  }

  Future<void> loadMorePosts() async {
    if (state is PostsSuccess && _hasMorePosts && _currentPage < _totalPages) {
      emit(PostsState.loadingMorePosts(
        currentPosts: _allPosts,
        currentPage: _currentPage,
      ));

      _currentPage++;
      await loadPosts(isLoadingMore: true);
    }
  }

  Future<void> loadPosts({bool isLoadingMore = false}) async {
    final result = await _postsRepo.getPosts(page: _currentPage);

    result.when(
      success: (data) {
        final serverLikedPosts = data.model.items
            .where((post) => post.isLiked)
            .map((post) => post.id)
            .toSet();

        _likedPosts.addAll(serverLikedPosts);
        SharedPrefHelper.updateLikedPosts(_likedPosts);

        final newPosts = data.model.items.map((post) {
          return post.copyWith(
            isLiked: _likedPosts.contains(post.id),
          );
        }).toList();

        if (isLoadingMore) {
          _allPosts = [..._allPosts, ...newPosts];
          _allUnfilteredPosts = [..._allUnfilteredPosts, ...newPosts];
        } else {
          _allPosts = newPosts;
          _allUnfilteredPosts = newPosts;
        }

        _totalPages = data.model.totalPages;
        _hasMorePosts = _currentPage < _totalPages;

        if (_currentSearchQuery.isNotEmpty) {
          searchPosts(_currentSearchQuery);
        } else {
          emit(PostsState.postsSuccess(
            posts: _allPosts,
            hasMorePosts: _hasMorePosts,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ));
        }
      },
      failure: (error) {
        if (isLoadingMore) _currentPage--;
        emit(PostsState.postsError(error: error));
      },
    );
  }

  Future<void> createPost(CreatePostRequest requestModel) async {
    emit(const PostsState.createPostLoading());
    final result = await _postsRepo.createPost(requestModel);
    result.when(
      success: (data) async {
        emit(PostsState.createPostSuccess(data));
        _currentPage = 1;
        _allPosts = [];
        _allUnfilteredPosts = [];
        _currentSearchQuery = '';
        await loadPosts();
      },
      failure: (error) {
        emit(PostsState.createPostError(error: error));
      },
    );
  }

  Future<void> likePost(int postId) async {
    try {
      _updateLocalLike(postId, true);
      await SharedPrefHelper.addLikedPost(postId);
      await _postsRepo.likePost(postId);
    } catch (error) {
      _updateLocalLike(postId, false);
      await SharedPrefHelper.removeLikedPost(postId);
    }
  }

  Future<void> unlikePost(int postId) async {
    try {
      _updateLocalLike(postId, false);
      await SharedPrefHelper.removeLikedPost(postId);
      await _postsRepo.unlikePost(postId);
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

    _allUnfilteredPosts = _allUnfilteredPosts.map((post) {
      if (post.id == postId) {
        return post.copyWith(
          isLiked: isLiked,
          likesCount: isLiked ? post.likesCount + 1 : post.likesCount - 1,
        );
      }
      return post;
    }).toList();

    if (_currentSearchQuery.isNotEmpty) {
      searchPosts(_currentSearchQuery);
    } else {
      emit(PostsState.postsSuccess(
        posts: _allPosts,
        hasMorePosts: _hasMorePosts,
        currentPage: _currentPage,
        totalPages: _totalPages,
      ));
    }
  }

  Future<void> searchPosts(String query) async {
    _currentSearchQuery = query.toLowerCase();

    if (_currentSearchQuery.isEmpty) {
      emit(PostsState.postsSuccess(
        posts: _allUnfilteredPosts,
        hasMorePosts: _hasMorePosts,
        currentPage: _currentPage,
        totalPages: _totalPages,
      ));
      return;
    }

    final filteredPosts = _allUnfilteredPosts.where((post) {
      final nameMatch = post.engineerName?.toLowerCase().contains(_currentSearchQuery) ?? false;
      final contentMatch = post.content?.toLowerCase().contains(_currentSearchQuery) ?? false;
      return nameMatch || contentMatch;
    }).toList();

    emit(PostsState.postsSuccess(
      posts: filteredPosts,
      hasMorePosts: false,
      currentPage: _currentPage,
      totalPages: _totalPages,
    ));
  }

  void clearSearch() {
    _currentSearchQuery = '';
    emit(PostsState.postsSuccess(
      posts: _allUnfilteredPosts,
      hasMorePosts: _hasMorePosts,
      currentPage: _currentPage,
      totalPages: _totalPages,
    ));
  }
}