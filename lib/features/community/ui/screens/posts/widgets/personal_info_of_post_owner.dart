import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/core/theming/text_styles.dart';

class PersonalInfoOfPostOwner extends StatelessWidget {
  final String engineerName;
  final String? profileImageUrl;
  final String creationDate;

  const PersonalInfoOfPostOwner({
    super.key,
    required this.engineerName,
    this.profileImageUrl,
    required this.creationDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 21.w,
        backgroundColor: Colors.transparent,
        child: profileImageUrl != null
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: profileImageUrl!,
                  fit: BoxFit.cover,
                  width: 42.w,
                  height: 42.w,
                  errorWidget: (context, url, error) => SvgPicture.asset(
                    'assets/svgs/app_prof.svg',
                    width: 42.w,
                    height: 42.w,
                  ),
                ),
              )
            : SvgPicture.asset(
                'assets/svgs/app_prof.svg',
                width: 42.w,
                height: 42.w,
              ),
      ),
      title: Text(
        engineerName,
        style: TextStyles.font12LightBlackMedium,
      ),
      subtitle: Text(
        getRelativeTime(creationDate),
        style: TextStyles.font10lightBlackRegularWithOpacity,
      ),
    );
  }
}
