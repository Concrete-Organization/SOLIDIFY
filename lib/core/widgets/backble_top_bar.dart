import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackableTopBar extends StatelessWidget {
  final String screenTitle;
  final String? suffixIconPath;
  final VoidCallback? onSuffixIconTap;

  const BackableTopBar({
    super.key,
    required this.screenTitle,
    this.suffixIconPath,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Icon
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

          Text(
            screenTitle,
            style: TextStyles.font18MainSemiBold,
          ),
          suffixIconPath != null
              ? GestureDetector(
                  onTap: onSuffixIconTap,
                  child: SvgPicture.asset(
                    suffixIconPath!,
                    height: 24.h,
                    width: 24.h,
                  ),
                )
              : SizedBox(width: 24.h), // Placeholder to keep title centered
        ],
      ),
    );
  }
}
