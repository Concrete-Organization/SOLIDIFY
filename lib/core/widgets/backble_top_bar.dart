import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackableTopBar extends StatelessWidget {
  final String screenTitle;

  const BackableTopBar({
    super.key,
    required this.screenTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(
              'assets/svgs/back_arrow.svg',
              height: 24.h,
              width: 24.h,
            ),
          ),
          horizontalSpace(70),
          Text(
            screenTitle,
            style: TextStyles.font18MainSemiBold,
          ),
        ],
      ),
    );
  }
}
