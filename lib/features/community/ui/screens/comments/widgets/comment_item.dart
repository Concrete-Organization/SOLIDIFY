import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CommentItem extends StatelessWidget {
  final String profileImage;
  final String name;
  final String timeAgo;
  final String comment;
  final int likes;

  const CommentItem({
    super.key,
    required this.profileImage,
    required this.name,
    required this.timeAgo,
    required this.comment,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 17.w,
              backgroundImage: AssetImage(profileImage),
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.font10lightBlackRegularWithOpacity,
                ),
                verticalSpace(2),
                Text(
                  timeAgo,
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
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 45.w),
              child: Text(
                comment,
                style: TextStyles.font10lightBlackRegular,
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
                  likes.toString(),
                  style: TextStyles.font8lightBlackLightWith70Opacity,
                ),

              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 45.w),
          child: Row(
            children: [
              Text(
                'Replay',
                style: TextStyles.font8lightBlackLightWith70Opacity,
              ),
            ],
          ),
        ),
        verticalSpace(5),
        Padding(
          padding: EdgeInsets.only(left: 50.w),
          child: Text(
            'Show 1 more reply',
            style: TextStyles.font8lightBlackLightWith70Opacity,
          ),
        ),
        verticalSpace(16),
      ],
    );
  }
}
