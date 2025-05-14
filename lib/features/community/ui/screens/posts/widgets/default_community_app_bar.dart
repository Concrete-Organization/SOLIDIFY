import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';

class DefaultCommunityAppBar extends StatelessWidget {
  final VoidCallback onSearchPressed;

  const DefaultCommunityAppBar({
    super.key,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onSearchPressed,
          child: SvgPicture.asset(
            'assets/svgs/search_icon.svg',
            width: 20.w,
            height: 20.h,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.createPostScreen,
              arguments: context.read<PostsCubit>(),
            );
          },
          child: SvgPicture.asset(
            'assets/svgs/plus_icon.svg',
            width: 20.w,
            height: 20.h,
            colorFilter: ColorFilter.mode(
              ColorsManager.mainBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
