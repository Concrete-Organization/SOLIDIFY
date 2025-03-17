import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/post_item.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/shimmer_post_item.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_state.dart';

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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.post_add,
                      size: 50,
                      color: ColorsManager.mainBlue.withOpacity(0.7),
                    ),
                    verticalSpace(16),
                    Text(
                      'No posts yet',
                      style: TextStyles.font14lightBlackRegular,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(10),
                    TextButton(
                      onPressed: () {
                        // Navigate to create post
                      },
                      child: Text(
                        'Create your first post',
                        style: TextStyles.font15MainBlueMedium,
                      ),
                    ),
                  ],
                ),
              );
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
                  return PostItem(post: posts[index]);
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