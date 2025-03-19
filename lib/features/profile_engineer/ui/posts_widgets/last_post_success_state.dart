import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/profile_post_item.dart';
import 'profile_engineer_all_posts.dart';

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
              child: Text(
                'Show all posts ->',
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