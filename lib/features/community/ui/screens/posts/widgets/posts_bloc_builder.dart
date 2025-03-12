import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/posts_list_view.dart';

class PostsBlocBuilder extends StatelessWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          postsLoading: () => const Center(child: CircularProgressIndicator()),
          postsSuccess: (posts) {
            print('Rendering ${posts.length} posts');
            return PostsListView(posts: posts);
          },
          postsError: (error) => Center(child: Text('Error: ${error.message}')),
          createPostLoading: () => const Center(child: CircularProgressIndicator()),
          createPostSuccess: (response) {
            print('Create post success in UI');
            return const SizedBox.shrink();
          },
          createPostError: (error) => Center(child: Text('Error: ${error.message}')),
        );
      },
    );
  }
}