import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_request.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;

  PostsCubit(this._postsRepo) : super(const PostsState.initial());

  Future<void> fetchPosts() async {
    emit(const PostsState.postsLoading());
    final result = await _postsRepo.getPosts();
    result.when(
      success: (data) {
        print('Fetched posts: ${data.model.items.length} items');
        emit(PostsState.postsSuccess(data.model.items));
      },
      failure: (error) {
        print('Fetch posts error: ${error.message}');
        emit(PostsState.postsError(error: error));
      },
    );
  }

  Future<void> createPost(CreatePostRequest requestModel) async {
    emit(const PostsState.createPostLoading());
    final result = await _postsRepo.createPost(requestModel);
    await result.when(
      success: (data) async {
        print('Post created successfully');
        await fetchPosts();
        emit(PostsState.createPostSuccess(data));
      },
      failure: (error) {
        print('Create post error: ${error.message}');
        emit(PostsState.createPostError(error: error));
      },
    );
  }
}