import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ReplyingToRow extends StatelessWidget {
  final String engineerName;
  final VoidCallback onCancel;

  const ReplyingToRow({
    super.key,
    required this.engineerName,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Replying to $engineerName',
            style: TextStyles.font10lightBlackRegularWithOpacity,
          ),
          GestureDetector(
            onTap: onCancel,
            child: Icon(
              Icons.close,
              size: 16.w,
              color: ColorsManager.lightBlack,
            ),
          ),
        ],
      ),
    );
  }
}
