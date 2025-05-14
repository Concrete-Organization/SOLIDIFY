import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/features/profile_engineer/data/models/comment_with_post.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/comment_with_post_item.dart';

class ProfileEngineerAllCommentsListSuccessState extends StatelessWidget {
  final List<CommentWithPost> comments;
  final bool hasMore;

  const ProfileEngineerAllCommentsListSuccessState({
    super.key,
    required this.comments,
    required this.hasMore,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (hasMore &&
            scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          context.read<ProfileEngineerCommentsCubit>().loadMoreComments();
          return true;
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () =>
            context.read<ProfileEngineerCommentsCubit>().fetchEngineerComments(
                  comments.first.comment.engineerId,
                ),
        color: ColorsManager.white,
        backgroundColor: ColorsManager.mainBlue,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return CommentWithPostItem(commentWithPost: comments[index]);
          },
        ),
      ),
    );
  }
}
