import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/logic/posts_cubit.dart';
import 'package:solidify/features/community/logic/posts_state.dart';
import 'package:solidify/features/community/ui/widgets/posts_list_view.dart';

class PostsBlocBuilder extends StatelessWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          postsLoading: () => const Center(child: CircularProgressIndicator()),
          postsSuccess: (posts) => PostsListView(posts: posts),
          postsError: (error) => Center(
            child: Text('Error: ${error.message}'),
          ),
        );
      },
    );
  }
}
