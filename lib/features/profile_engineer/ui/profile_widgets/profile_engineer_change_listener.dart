import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';
import '../../logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import '../../logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';

class ProfileEngineerChangeListener extends StatelessWidget {
  const ProfileEngineerChangeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EngineerProfileCubit, EngineerProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (engineerId, profile) {
            context
                .read<ProfileEngineerPostsCubit>()
                .fetchEngineerPosts(engineerId);

            context
                .read<ProfileEngineerCommentsCubit>()
                .fetchEngineerComments(engineerId);

          },
          orElse: () {},
        );
      },
      child: SizedBox.shrink(),
    );
  }
}