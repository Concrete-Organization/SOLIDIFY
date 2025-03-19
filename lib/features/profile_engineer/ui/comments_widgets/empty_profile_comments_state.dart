import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class EmptyProfileCommentsState extends StatelessWidget {
  const EmptyProfileCommentsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.comment,
            size: 50,
            color: ColorsManager.mainBlue.withOpacity(0.7),
          ),
          verticalSpace(16),
          Text(
            'No comments yet',
            style: TextStyles.font14lightBlackRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}