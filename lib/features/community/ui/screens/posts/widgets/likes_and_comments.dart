import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/ui/screens/comments/comments_bottom_sheet.dart';

class LikesAndComments extends StatelessWidget {
  final int likesCount;
  final int commentsCount;
  final int postId;
  final bool isLiked;


  const LikesAndComments({
    super.key,
    required this.likesCount,
    required this.commentsCount,
    required this.postId,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _handleLike(context),
          child: SvgPicture.asset(
            isLiked
                ? 'assets/svgs/fill_fav_icon.svg'
                : 'assets/svgs/fav_icon.svg',
          ),
        ),
        horizontalSpace(3),
        Text(
          likesCount.toString(),
          style: TextStyles.font12LightBlackRegular,
        ),
        horizontalSpace(6),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return CommentsBottomSheet(
                  scrollController: ScrollController(),
                  postId: postId,
                );
              },
            );
          },
          child: SvgPicture.asset('assets/svgs/comment_icon.svg'),
        ),
        horizontalSpace(3),
        Text(
          commentsCount.toString(),
          style: TextStyles.font12LightBlackRegular,
        ),
      ],
    );
  }
  void _handleLike(BuildContext context) {
    final cubit = context.read<PostsCubit>();
    if (isLiked) {
      cubit.unlikePost(postId);
    } else {
      cubit.likePost(postId);
    }
  }
}
