import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  final List<PostModel> posts;

  const PostsListView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: posts.length,
      separatorBuilder: (_, __) => verticalSpace(30),
      itemBuilder: (context, index) => PostItem(post: posts[index]),
    );
  }
}