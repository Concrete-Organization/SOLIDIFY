import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/ui/widgets/likes_and_comments.dart';
import 'package:solidify/features/community/ui/widgets/personal_info_of_post_owner.dart';
import 'package:solidify/features/community/ui/widgets/post_content.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalInfoOfPostOwner(
          engineerName: post.engineerName ?? 'Unknown',
          profileImageUrl: post.profileImageUrl,
          creationDate: post.creationDate,
        ),
        PostContent(
          content: post.content ?? '',
          imageUris: post.imageUris,
        ),
        verticalSpace(11),
        LikesAndComments(
          likesCount: post.likesCount,
          commentsCount: post.commentsCount,
        ),
      ],
    );
  }
}
