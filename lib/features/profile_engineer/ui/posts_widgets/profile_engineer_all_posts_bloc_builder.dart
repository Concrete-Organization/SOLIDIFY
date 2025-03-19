import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/shimmer_posts_list.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_state.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/profile_engineer_all_posts_list_success_state.dart';
import 'empty_profile_posts_state.dart';

class ProfileEngineerAllPostsBlocBuilder extends StatelessWidget {
  const ProfileEngineerAllPostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEngineerPostsCubit, ProfileEngineerPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => ShimmerPostsList(),
          success: (posts) => posts.isEmpty
              ? EmptyProfilePostsState()
              : ProfileEngineerAllPostsListSuccessState(
                  posts: posts,
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
