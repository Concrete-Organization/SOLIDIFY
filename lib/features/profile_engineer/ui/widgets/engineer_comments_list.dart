import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_comments/engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_comments/engineer_comments_state.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/profile_comment_item.dart';

class EngineerCommentsList extends StatelessWidget {
  const EngineerCommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerCommentsCubit, EngineerCommentsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (comments, hasMore) {
            if (comments.isEmpty) {
              return Center(
                child: Text(
                  'No comments yet',
                  style: TextStyles.font14lightBlackRegular,
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ProfileCommentItem(comment: comments[index]);
              },
            );
          },
          error: (error) => Center(
            child: Text(error.getAllErrorMessages()),
          ),
        );
      },
    );
  }
}

