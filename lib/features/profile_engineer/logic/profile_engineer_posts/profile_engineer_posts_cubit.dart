import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_state.dart';

class ProfileEngineerPostsCubit extends Cubit<ProfileEngineerPostsState> {
  final PostsRepo _postsRepo;
  String? _engineerId;

  ProfileEngineerPostsCubit(this._postsRepo)
      : super(const ProfileEngineerPostsState.initial());

  Future<void> fetchEngineerPosts(String engineerId) async {
    _engineerId = engineerId;
    emit(const ProfileEngineerPostsState.loading());
    await _loadPosts();
  }

  Future<void> refreshPosts() async {
    if (_engineerId == null) return;
    await _loadPosts();
  }

  Future<void> _loadPosts() async {
    if (_engineerId == null) {
      emit(
        ProfileEngineerPostsState.error(
          ApiErrorModel(message: 'Engineer ID not provided'),
        ),
      );
      return;
    }

    final result = await _postsRepo.getPosts();

    result.when(
      success: (data) {
        final engineerPosts = data.model.items
            .where((post) => post.engineerId == _engineerId)
            .toList();

        engineerPosts.sort((a, b) => b.creationDate.compareTo(a.creationDate));

        emit(ProfileEngineerPostsState.success(engineerPosts));
      },
      failure: (error) {
        emit(ProfileEngineerPostsState.error(error));
      },
    );
  }
}
