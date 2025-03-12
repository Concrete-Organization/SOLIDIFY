import 'package:flutter_bloc/flutter_bloc.dart';
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

  PostsCubit(this._postsRepo) : super(const PostsState.initial());

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
        print('Fetched posts: ${data.model.items.length} items');

        if (isLoadingMore) {
          _allPosts = [..._allPosts, ...data.model.items];
        } else {
          _allPosts = data.model.items;
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
        print('Fetch posts error: ${error.message}');
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
        print('Post created successfully');
        _currentPage = 1;
        _allPosts = [];
        await _loadPosts();
        emit(PostsState.createPostSuccess(data));
      },
      failure: (error) {
        print('Create post error: ${error.message}');
        emit(PostsState.createPostError(error: error));
      },
    );
  }
}