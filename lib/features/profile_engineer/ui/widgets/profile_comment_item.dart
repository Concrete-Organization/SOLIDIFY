import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/expandable_text.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';

class ProfileCommentItem extends StatelessWidget {
  final CommentModel comment;

  const ProfileCommentItem({super.key, required this.comment});

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
              backgroundColor: Colors.transparent,
              child: comment.profileImageUrl != null &&
                      Uri.tryParse(comment.profileImageUrl!)?.hasAbsolutePath ==
                          true
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(17.w),
                      child: CachedNetworkImage(
                        imageUrl: comment.profileImageUrl!,
                        width: 34.w,
                        height: 34.w,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            SvgPicture.asset('assets/svgs/app_prof.svg'),
                      ),
                    )
                  : SvgPicture.asset('assets/svgs/app_prof.svg'),
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
          ],
        ),
        verticalSpace(13),
        HorizontalDivider(thickness: 0.2),
        verticalSpace(16),
      ],
    );
  }
}
