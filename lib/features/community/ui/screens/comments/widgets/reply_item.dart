import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_network_cached_app_profile_pic.dart';
import 'package:solidify/core/widgets/expandable_text.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';

class ReplyItem extends StatelessWidget {
  final ReplyModel reply;

  const ReplyItem({super.key, required this.reply});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.w, top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkCachedAppProfilePic(
                profileImageUrl: reply.profileImageUrl,
                radius: 17,
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10),
                  Text(
                    reply.engineerName ?? 'Unknown',
                    style: TextStyles.font10lightBlackRegularWithOpacity,
                  ),
                  verticalSpace(2),
                  Text(
                    getRelativeTime(reply.creationDate),
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
                  padding: EdgeInsets.symmetric(horizontal: 45.w),
                  child: ExpandableText(
                    text: reply.content,
                    style: TextStyles.font10lightBlackRegular,
                    maxLines: 3,
                    fontSize: 8,
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _handleLikeReply(context, reply.id),
                    child: SvgPicture.asset(
                      reply.isLiked
                          ? 'assets/svgs/fill_fav_icon.svg'
                          : 'assets/svgs/fav_icon.svg',
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                  verticalSpace(1),
                  Text(
                    reply.likesCount.toString(),
                    style: TextStyles.font8lightBlackLightWith70Opacity,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _handleLikeReply(BuildContext context, int replyId) {
    final cubit = context.read<CommentsCubit>();
    if (reply.isLiked) {
      cubit.unlikeReply(replyId);
    } else {
      cubit.likeReply(replyId);
    }
  }
}
