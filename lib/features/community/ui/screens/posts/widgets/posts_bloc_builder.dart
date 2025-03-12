import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/posts_list_view.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/shimmer_post_item.dart';

class PostsBlocBuilder extends StatelessWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<PostsCubit>().fetchPosts();
            });
            return _buildShimmerList();
            },
          postsLoading: () => _buildShimmerList(),
          postsSuccess: (posts, hasMorePosts, currentPage, totalPages) {
            return PostsListView(
              posts: posts,
              hasMorePosts: hasMorePosts,
              loadMorePosts: () => context.read<PostsCubit>().loadMorePosts(),
              refreshPosts: () => context.read<PostsCubit>().fetchPosts(refresh: true),
            );
          },
          loadingMorePosts: (currentPosts, currentPage) {
            return PostsListView(
              posts: currentPosts,
              hasMorePosts: true,
              isLoadingMore: true,
              loadMorePosts: () {},
              refreshPosts: () => context.read<PostsCubit>().fetchPosts(refresh: true),
            );
          },
          postsError: (error) => Center(child: Text('Error: ${error.message}')),
          createPostLoading: () => const Center(child: CircularProgressIndicator()),
          createPostSuccess: (response) => const SizedBox.shrink(),
          createPostError: (error) => Center(child: Text('Error: ${error.message}')),
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) => const ShimmerPostItem(),
    );
  }
}