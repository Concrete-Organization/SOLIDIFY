import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsListViewItem extends StatelessWidget {
  final String title;
  final String message;
  final String timeAgo;
  final bool isHighlighted;

  const NotificationsListViewItem({
    super.key,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Span full width
      padding:
          EdgeInsets.symmetric(vertical: 12.h), // Remove horizontal padding
      decoration: BoxDecoration(
        color: isHighlighted
            ? ColorsManager.mainBlueWith15Opacity
            : Colors.transparent,
        border: isHighlighted
            ? Border(
                top: BorderSide(
                  color: ColorsManager.mainBlue.withOpacity(0.2),
                  width: 1.w,
                ),
                bottom: BorderSide(
                  color: ColorsManager.mainBlue.withOpacity(0.2),
                  width: 1.w,
                ),
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 18.w), // Add padding only for content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.font15lightBlackMedium,
                ),
                Text(
                  timeAgo,
                  style: TextStyles.font12lightBlackLight,
                ),
              ],
            ),
            verticalSpace(8),
            Text(
              message,
              style: TextStyles.font12lightBlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
