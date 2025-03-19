import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/shimmer_comment_with_post_list.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_state.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/profile_engineer_all_comments_list_success_state.dart';
import 'empty_profile_comments_state.dart';

class ProfileEngineerAllCommentsBlocBuilder extends StatelessWidget {
  const ProfileEngineerAllCommentsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEngineerCommentsCubit, ProfileEngineerCommentsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => ShimmerCommentWithPostList(itemCount: 10),
          success: (comments, hasMore) => comments.isEmpty
              ? const EmptyProfileCommentsState()
              : ProfileEngineerAllCommentsListSuccessState(
            comments: comments,
            hasMore: hasMore,
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