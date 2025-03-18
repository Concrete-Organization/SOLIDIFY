import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/shimmer_post_item.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_state.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/empty_posts_state.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/engineer_all_posts.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/profile_post_item.dart';

class LatestPostSection extends StatelessWidget {
  final String engineerId;

  const LatestPostSection({super.key, required this.engineerId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerPostsCubit, EngineerPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const ShimmerPostItem(),
          success: (posts) {
            if (posts.isEmpty) {
              return EmptyPostsState();
            }
            final latestPost = posts.first;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ProfilePostItem(post: latestPost),
                  verticalSpace(40),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EngineerAllPosts(
                            engineerId: engineerId,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Show all posts ->',
                      style: TextStyles.font15MainBlueMedium,
                    ),
                  ),
                ],
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
}
