import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/likes_and_comments.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/personal_info_of_post_owner.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/post_content.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<EngineerProfileCubit, EngineerProfileState>(
          builder: (context, state) {
            return PersonalInfoOfPostOwner(
              engineerName: post.engineerName ?? 'Unknown',
              profileImageUrl: context
                  .read<EngineerProfileCubit>()
                  .userData
                  .model
                  ?.profileImageUrl ??
                  post.profileImageUrl,
              creationDate: post.creationDate,
            );
          },
        ),
        PostContent(
          content: post.content ?? '',
          imageUris: post.imageUris,
        ),
        verticalSpace(11),
        LikesAndComments(
          likesCount: post.likesCount,
          commentsCount: post.commentsCount,
          postId: post.id,
          isLiked: post.isLiked,
        ),
      ],
    );
  }
}
