import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/helpers/format_date.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/comment_item.dart';
import '../../../../logic/comments/comments_cubit.dart';
import '../../../../logic/comments/comments_state.dart';

class CommentsListView extends StatelessWidget {
  final ScrollController scrollController;
  final int postId;

  const CommentsListView({
    super.key,
    required this.scrollController,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CommentsCubit>()..fetchComments(postId),
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommentsError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is CommentsSuccess) {
            return ListView.builder(
              controller: scrollController,
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return CommentItem(
                  profileImage: comment.profileImageUrl ?? 'assets/images/app_prof.png',
                  name: comment.engineerName ?? 'Unknown',
                  timeAgo: getRelativeTime(comment.creationDate),
                  comment: comment.content ?? 'No content',
                  likes: comment.likesCount,
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}