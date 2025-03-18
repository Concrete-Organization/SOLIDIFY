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
      width: double.infinity, // Ensures the container takes full width
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isHighlighted
            ? ColorsManager.mainBlueWith15Opacity
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and timeAgo on the same row
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
    );
  }
}
