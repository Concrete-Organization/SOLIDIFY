import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/text_styles.dart';

class RepliesToggle extends StatelessWidget {
  final bool isExpanded;
  final int repliesCount;
  final VoidCallback onTap;

  const RepliesToggle({
    super.key,
    required this.isExpanded,
    required this.repliesCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 50.w, top: 8.h),
        child: Text(
          isExpanded
              ? 'Hide $repliesCount ${repliesCount > 1 ? 'replies' : 'reply'}'
              : 'Show $repliesCount ${repliesCount > 1 ? 'replies' : 'reply'}',
          style: TextStyles.font8lightBlackLightWith70Opacity,
        ),
      ),
    );
  }
}
