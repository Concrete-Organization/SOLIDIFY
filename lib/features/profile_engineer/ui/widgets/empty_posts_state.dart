import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class EmptyPostsState extends StatelessWidget {
  const EmptyPostsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.post_add,
            size: 50,
            color: ColorsManager.mainBlue.withOpacity(0.7),
          ),
          verticalSpace(16),
          Text(
            'No posts yet',
            style: TextStyles.font14lightBlackRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.createPostScreen);
            },
            child: Text(
              'Create your first post',
              style: TextStyles.font15MainBlueMedium,
            ),
          ),
        ],
      ),
    );
  }
}
