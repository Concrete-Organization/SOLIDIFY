import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/comments_list_view.dart';

class CommentsBlocBuilder extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsBlocBuilder({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is CommentsLoading) {
          return const LoadingCircleIndicator();
        } else if (state is CommentsSuccess) {
          return CommentsListView(
            scrollController: scrollController,
            comments: state.comments,
          );
        } else if (state is CommentsError) {
          return ErrorStateMessage(
            message: state.error.getAllErrorMessages(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}