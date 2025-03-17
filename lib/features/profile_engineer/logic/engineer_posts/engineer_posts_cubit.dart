import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_state.dart';

class EngineerPostsCubit extends Cubit<EngineerPostsState> {
  final PostsRepo _postsRepo;
  String? _engineerId;

  EngineerPostsCubit(this._postsRepo) : super(const EngineerPostsState.initial());

  Future<void> fetchEngineerPosts(String engineerId) async {
    _engineerId = engineerId;
    emit(const EngineerPostsState.loading());
    await _loadPosts();
  }

  Future<void> refreshPosts() async {
    if (_engineerId == null) return;
    await _loadPosts();
  }

  Future<void> _loadPosts() async {
    if (_engineerId == null) {
      emit(EngineerPostsState.error(ApiErrorModel(message: 'Engineer ID not provided')));
      return;
    }

    final result = await _postsRepo.getPosts();

    result.when(
      success: (data) {
        final engineerPosts = data.model.items
            .where((post) => post.engineerId == _engineerId)
            .toList();

        engineerPosts.sort((a, b) => b.creationDate.compareTo(a.creationDate));

        emit(EngineerPostsState.success(engineerPosts));
      },
      failure: (error) {
        emit(EngineerPostsState.error(error));
      },
    );
  }
}