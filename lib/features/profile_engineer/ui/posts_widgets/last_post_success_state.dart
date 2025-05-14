import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/profile_engineer_all_posts.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/profile_post_item.dart';

class LastPostSuccessState extends StatelessWidget {
  final List<PostModel> posts;
  final String engineerId;

  const LastPostSuccessState({
    super.key,
    required this.posts,
    required this.engineerId,
  });

  @override
  Widget build(BuildContext context) {
    final latestPost = posts.first;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            ProfilePostItem(post: latestPost),
            verticalSpace(25),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEngineerAllPosts(
                      engineerId: engineerId,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show all posts',
                    style: TextStyles.font12MainBlueMedium,
                  ),
                  horizontalSpace(10),
                  SvgPicture.asset(
                    'assets/svgs/see_all_arrow.svg',
                  ),
                ],
              ),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}