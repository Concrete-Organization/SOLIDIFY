import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ProfileEngineerNameAndImage extends StatelessWidget {
  final String engineerName;
  final String? profileImageUrl;

  const ProfileEngineerNameAndImage({
    super.key,
    required this.engineerName,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 37.5.r,
              child: profileImageUrl != null && profileImageUrl!.isNotEmpty
                  ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: profileImageUrl!,
                  width: 75.w,
                  height: 75.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      SvgPicture.asset('assets/svgs/app_prof.svg'),
                ),
              )
                  : SvgPicture.asset('assets/svgs/app_prof.svg'),
            ),
            Positioned(
              bottom: -5,
              right: -10,
              child: Container(
                padding: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.white,
                  border: Border.all(color: ColorsManager.mainBlue),
                ),
                child: SvgPicture.asset(
                  'assets/svgs/edit_icon.svg',
                  width: 15.w,
                  height: 15.h,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(13),
        Text(
          engineerName,
          style: TextStyles.font12MainBlueMedium,
        ),
      ],
    );
  }
}
