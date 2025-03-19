import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/core/widgets/shimmer_comment_list.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_state.dart';
import 'empty_profile_comments_state.dart';
import 'last_four_comments_success_state.dart';

class LastFourCommentsForTheUserBlocBuilder extends StatelessWidget {
  final String engineerId;

  const LastFourCommentsForTheUserBlocBuilder({super.key, required this.engineerId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEngineerCommentsCubit, ProfileEngineerCommentsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: LoadingCircleIndicator()),
          loading: () => ShimmerCommentList(itemCount: 4),
          success: (comments, hasMore) => comments.isEmpty
              ? const EmptyProfileCommentsState()
              : LastFourCommentsSuccessState(
            comments: comments,
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