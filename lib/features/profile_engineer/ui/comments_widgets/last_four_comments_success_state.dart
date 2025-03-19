import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/profile_engineer/data/models/comment_with_post.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/profile_comment_item.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/profile_engineer_all_comments.dart';

class LastFourCommentsSuccessState extends StatelessWidget {
  final List<CommentWithPost> comments;
  final String engineerId;

  const LastFourCommentsSuccessState({
    super.key,
    required this.comments,
    required this.engineerId,
  });

  @override
  Widget build(BuildContext context) {
    final lastFourComments =
        comments.length > 4 ? comments.sublist(0, 4) : comments;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lastFourComments.length,
              itemBuilder: (context, index) {
                return ProfileCommentItem(
                  comment: lastFourComments[index].comment,
                );
              },
            ),
            verticalSpace(25),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEngineerAllComments(
                      engineerId: engineerId,
                    ),
                  ),
                );
              },
              child: Text(
                'Show all comments ->',
                style: TextStyles.font15MainBlueMedium,
              ),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
