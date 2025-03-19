import 'package:flutter/material.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/personal_info_of_post_owner.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/post_content.dart';

class ProfilePostItem extends StatelessWidget {
  final PostModel post;

  const ProfilePostItem({super.key, required this.post});

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
      ],
    );
  }
}
