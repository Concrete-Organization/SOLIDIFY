import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:intl/intl.dart';

class AboutYourAccountScreen extends StatelessWidget {
  const AboutYourAccountScreen({super.key});

  Future<String> _getFormattedDate() async {
    final String dateString = await SharedPrefHelper.getString(
      SharedPrefKeys.joinedDate,
    );
    if (dateString.isEmpty) return 'N/A';

    final DateTime date = DateTime.parse(dateString);
    return DateFormat('MMM y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About your account',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FutureBuilder<String>(
          future: _getFormattedDate(),
          builder: (context, snapshot) {
            final String date = snapshot.data ?? 'N/A';
            return Column(
              children: [
                verticalSpace(20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset('assets/svgs/joined_date.svg'),
                  title: Text(
                    'Joined date',
                    style: TextStyles.font15lightBlackMedium,
                  ),
                  trailing: Text(
                    date,
                    style: TextStyles.font12LightBlackRegular.copyWith(
                      color: ColorsManager.lightBlack.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
