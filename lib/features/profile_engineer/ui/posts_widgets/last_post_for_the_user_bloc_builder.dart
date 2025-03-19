import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/core/widgets/shimmer_post_item.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_state.dart';
import 'empty_profile_posts_state.dart';
import 'last_post_success_state.dart';

class LastPostForTheUserBlocBuilder extends StatelessWidget {
  final String engineerId;

  const LastPostForTheUserBlocBuilder({super.key, required this.engineerId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEngineerPostsCubit, ProfileEngineerPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: LoadingCircleIndicator()),
          loading: () => const ShimmerPostItem(),
          success: (posts) => posts.isEmpty
              ? EmptyProfilePostsState()
              : LastPostSuccessState(
                  posts: posts,
                  engineerId: engineerId,
                ),
          error: (error) => ErrorStateMessage(
            message: error.getAllErrorMessages(),
            lottieAssetPath: 'assets/lottie/error_animation.json',
          ),
        );
      },
    );
  }
}
