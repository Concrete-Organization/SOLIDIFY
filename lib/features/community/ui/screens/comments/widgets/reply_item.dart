import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';

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
              CircleAvatar(
                radius: 12.w,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  reply.profileImageUrl ?? 'assets/svgs/app_prof.svg',
                ),
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reply.engineerName,
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
          verticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    reply.content,
                    style: TextStyles.font10lightBlackRegular,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/fav_icon.svg',
                    width: 14.w,
                    height: 14.h,
                  ),
                  horizontalSpace(1),
                  Text(
                    reply.likesCount.toString(),
                    style: TextStyles.font8lightBlackLightWith70Opacity,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(8),
        ],
      ),
    );
  }
}
