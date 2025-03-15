import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/expandable_text.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/replies_toggle.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/reply_item.dart';

class CommentItem extends StatefulWidget {
  final CommentModel comment;

  const CommentItem({super.key, required this.comment});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final comment = widget.comment;
    final repliesCount = comment.replies.length;
    final hasReplies = repliesCount > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 17.w,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                comment.profileImageUrl ?? 'assets/svgs/app_prof.svg',
              ),
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                Text(
                  comment.engineerName ?? 'Unknown',
                  style: TextStyles.font10lightBlackRegularWithOpacity,
                ),
                verticalSpace(2),
                Text(
                  getRelativeTime(comment.creationDate),
                  style: TextStyles.font8lightBlackLightWith70Opacity,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 45.w),
                child: ExpandableText(
                  text: comment.content ?? 'No content',
                  style: TextStyles.font10lightBlackRegular,
                  maxLines: 3,
                  fontSize: 8,
                ),
              ),
            ),

            Column(
              children: [
                SvgPicture.asset(
                  'assets/svgs/fav_icon.svg',
                  width: 16.w,
                  height: 16.h,
                ),
                verticalSpace(1),
                Text(
                  comment.likesCount.toString(),
                  style: TextStyles.font8lightBlackLightWith70Opacity,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(5),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 45.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.read<CommentsCubit>().setReplyingToComment(comment),
                child: Text(
                  'Reply',
                  style: TextStyles.font8lightBlackLightWith70Opacity,
                ),
              ),
            ],
          ),
        ),
        if (hasReplies)
          RepliesToggle(
            isExpanded: isExpanded,
            repliesCount: repliesCount,
            onTap: () => setState(() => isExpanded = !isExpanded),
          ),
        if (isExpanded)
          ...comment.replies.map((reply) => ReplyItem(reply: reply)),
        verticalSpace(16),
      ],
    );
  }
}