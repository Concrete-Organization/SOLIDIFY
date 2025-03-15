import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';

class SearchCommunityAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onBackPressed;

  const SearchCommunityAppBar({
    super.key,
    required this.searchController,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackPressed,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorsManager.mainBlue,
            size: 20.w,
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: AppTextFormField(
            controller: searchController,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            hintText: 'Search...',
            onChanged: (query) {
              context.read<PostsCubit>().searchPosts(query);
            },
          ),
        ),
        if (searchController.text.isNotEmpty)
          GestureDetector(
            onTap: () {
              searchController.clear();
              context.read<PostsCubit>().clearSearch();
            },
            child: Icon(
              Icons.close,
              color: ColorsManager.mainBlue,
              size: 20.w,
            ),
          ),
      ],
    );
  }
}