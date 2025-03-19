import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/personal_info_of_post_owner.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/post_content.dart';
import 'package:solidify/features/profile_engineer/data/models/comment_with_post.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/profile_comment_item.dart';

class CommentWithPostItem extends StatelessWidget {
  final CommentWithPost commentWithPost;

  const CommentWithPostItem({super.key, required this.commentWithPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalInfoOfPostOwner(
              engineerName: commentWithPost.post.engineerName ?? 'Unknown',
              profileImageUrl: commentWithPost.post.profileImageUrl,
              creationDate: commentWithPost.post.creationDate,
            ),
            PostContent(
              content: commentWithPost.post.content ?? '',
              imageUris: commentWithPost.post.imageUris,
            ),
          ],
        ),
        verticalSpace(22),
        ProfileCommentItem(comment: commentWithPost.comment),
      ],
    );
  }
}