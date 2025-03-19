import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/features/community/data/models/post_models/get_posts_response.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/profile_post_item.dart';

class ProfileEngineerAllPostsListSuccessState extends StatelessWidget {
  final List<PostModel> posts;

  const ProfileEngineerAllPostsListSuccessState({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ProfileEngineerPostsCubit>().refreshPosts(),
      color: ColorsManager.white,
      backgroundColor: ColorsManager.mainBlue,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        itemCount: posts.length,
        separatorBuilder: (_, __) => verticalSpace(30),
        itemBuilder: (context, index) {
          return ProfilePostItem(post: posts[index]);
        },
      ),
    );
  }
}
