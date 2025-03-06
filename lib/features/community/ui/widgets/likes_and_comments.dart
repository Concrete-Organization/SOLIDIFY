import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/ui/screens/comments_bottom_sheet.dart';

class LikesAndComments extends StatelessWidget {
  final int likesCount;
  final int commentsCount;

  const LikesAndComments({
    super.key,
    required this.likesCount,
    required this.commentsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svgs/fav_icon.svg'),
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
                );
              },
            );
          },          child: SvgPicture.asset('assets/svgs/comment_icon.svg'),
        ),
        horizontalSpace(3),
        Text(
          commentsCount.toString(),
          style: TextStyles.font12LightBlackRegular,
        ),
      ],
    );
  }
}
