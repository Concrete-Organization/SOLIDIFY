import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/community/logic/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;

  PostsCubit(this._postsRepo) : super(const PostsState.initial());

  Future<void> fetchPosts() async {
    emit(const PostsState.postsLoading());

    final result = await _postsRepo.getPosts();

    result.when(
      success: (data) {
        emit(PostsState.postsSuccess(data.model.items));
      },
      failure: (error) {
        emit(PostsState.postsError(error: error));
      },
    );
  }
}