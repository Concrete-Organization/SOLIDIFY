import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/shimmer_post_item.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_state.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/empty_posts_state.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/profile_post_item.dart';

class EngineerPostsList extends StatelessWidget {
  const EngineerPostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerPostsCubit, EngineerPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => _buildShimmerList(),
          success: (posts) {
            if (posts.isEmpty) {
              return EmptyPostsState();
            }
            return RefreshIndicator(
              onRefresh: () => context.read<EngineerPostsCubit>().refreshPosts(),
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
          },
          error: (error) => ErrorStateMessage(
            message: error.getAllErrorMessages(),
            lottieAssetPath: 'assets/lottie/error_animation.json',
          ),
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: 3,
      itemBuilder: (context, index) => const ShimmerPostItem(),
    );
  }
}