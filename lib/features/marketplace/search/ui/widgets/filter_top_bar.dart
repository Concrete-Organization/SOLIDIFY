import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTopBar extends StatelessWidget implements PreferredSizeWidget {
  const FilterTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
         context.pop();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: SvgPicture.asset('assets/svgs/exit_icon.svg'),
        ),
      ),
      title: Text(
        'Filter',
        style: TextStyles.font18MainSemiBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
