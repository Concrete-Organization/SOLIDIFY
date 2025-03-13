import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/comment_item.dart';

class CommentsListView extends StatelessWidget {
  final ScrollController scrollController;
  final List<CommentModel> comments;

  const CommentsListView({
    super.key,
    required this.scrollController,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return Center(
        child: Text(
          'No Comments Yet',
          style: TextStyles.font15lightBlackRegularWith70Opacity,
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return CommentItem(
          profileImage: comment.profileImageUrl ?? 'assets/svgs/app_prof.svg',
          name: comment.engineerName ?? 'Unknown',
          timeAgo: getRelativeTime(comment.creationDate),
          comment: comment.content ?? 'No content',
          likes: comment.likesCount,
        );
      },
    );
  }
}
