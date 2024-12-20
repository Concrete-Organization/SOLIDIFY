import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaContainer extends StatelessWidget {
  final String iconImage;
  final void Function()? onPressed;
  const SocialMediaContainer({super.key, required this.iconImage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconImage,
          height: 31.h,
        ),
      ),
    );

  }
}