import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/comments_bloc_builder.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/comments_text_field.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final int postId;

  const CommentsBottomSheet({
    super.key,
    required this.scrollController,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bool keyboardVisible = bottomInset > 0;

    final double initialSize = keyboardVisible ? 0.9 : 0.6;
    final double minChildSize = keyboardVisible ? 0.9 : 0.3;

    return BlocProvider(
      create: (context) => getIt<CommentsCubit>()..fetchComments(postId),
      child: BlocListener<CommentsCubit, CommentsState>(
        listener: (context, state) {
          if (state is CreateCommentSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Comment added successfully')),
            );
          } else if (state is CreateCommentError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.getAllErrorMessages())),
            );
          }
        },
        child: DraggableScrollableSheet(
          initialChildSize: initialSize,
          minChildSize: minChildSize,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, sheetScrollController) {
            return Padding(
              padding: EdgeInsets.only(bottom: bottomInset),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Comments',
                      style: TextStyles.font15lightBlackMedium,
                    ),
                    verticalSpace(19),
                    Expanded(
                      child: CommentsBlocBuilder(
                        scrollController: sheetScrollController,
                      ),
                    ),
                    CommentsTextField(postId: postId),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}