import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundImage: profileImageUrl != null
            ? NetworkImage(profileImageUrl!)
            : const AssetImage('assets/images/app_prof.png') as ImageProvider,
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