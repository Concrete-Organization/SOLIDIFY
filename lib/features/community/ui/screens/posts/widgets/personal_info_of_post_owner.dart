import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_network_cached_app_profile_pic.dart';

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
      leading: CustomNetworkCachedAppProfilePic(
        profileImageUrl: profileImageUrl,
        radius: 21,
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
