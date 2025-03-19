import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNetworkCachedAppProfilePic extends StatelessWidget {
  final String? profileImageUrl;
  final double radius;
  final String placeholderAsset;

  const CustomNetworkCachedAppProfilePic({
    super.key,
    this.profileImageUrl,
    this.radius = 21.0,
    this.placeholderAsset = 'assets/svgs/app_prof.svg',
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.w,
      backgroundColor: Colors.grey[300],
      child: profileImageUrl != null
          ? ClipOval(
              child: CachedNetworkImage(
                imageUrl: profileImageUrl!,
                fit: BoxFit.cover,
                width: (radius * 2).w,
                height: (radius * 2).w,
                errorWidget: (context, url, error) => SvgPicture.asset(
                  placeholderAsset,
                  width: (radius * 2).w,
                  height: (radius * 2).w,
                ),
              ),
            )
          : SvgPicture.asset(
              placeholderAsset,
              width: (radius * 2).w,
              height: (radius * 2).w,
            ),
    );
  }
}
