import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class EmptyProfilePostsState extends StatelessWidget {
  const EmptyProfilePostsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.post_add,
            size: 50,
            color: ColorsManager.mainBlue.withValues(alpha: 0.7),
          ),
          verticalSpace(16),
          Text(
            'No posts yet',
            style: TextStyles.font14lightBlackRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
