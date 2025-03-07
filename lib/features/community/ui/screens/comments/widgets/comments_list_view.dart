import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/comment_item.dart';

class CommentsListView extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CommentItem(
          profileImage: 'assets/images/app_prof.png',
          name: 'User $index',
          timeAgo: getRelativeTime('${index}h'),
          comment: 'This is comment number $index',
          likes: index,
        );
      },
    );
  }
}