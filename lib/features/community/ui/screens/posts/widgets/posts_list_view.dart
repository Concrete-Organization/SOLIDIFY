import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/post_item.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/shimmer_post_item.dart';

class PostsListView extends StatefulWidget {
  final List<PostModel> posts;
  final bool hasMorePosts;
  final bool isLoadingMore;
  final Function loadMorePosts;
  final Future<void> Function() refreshPosts;

  const PostsListView({
    super.key,
    required this.posts,
    this.hasMorePosts = false,
    this.isLoadingMore = false,
    required this.loadMorePosts,
    required this.refreshPosts,
  });

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent / 2 &&
        widget.hasMorePosts &&
        !widget.isLoadingMore) {
      widget.loadMorePosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.refreshPosts,
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        itemCount: widget.posts.length + (widget.hasMorePosts ? 1 : 0),
        separatorBuilder: (_, __) => verticalSpace(30),
        itemBuilder: (context, index) {
          if (index < widget.posts.length) {
            return PostItem(post: widget.posts[index]);
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: ShimmerPostItem(),
              ),
            );
          }
        },
      ),
    );
  }
}
