import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/core/widgets/custom_network_cached_app_profile_pic.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/community/data/models/comment_models/create_comment_request.dart';
import 'package:solidify/features/community/data/models/comment_models/create_reply_request.dart';
import 'package:solidify/features/community/data/models/comment_models/get_comments_response.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';
import 'package:solidify/features/community/ui/screens/comments/widgets/replying_to_row.dart';

class CommentsTextField extends StatefulWidget {
  final int postId;

  const CommentsTextField({super.key, required this.postId});

  @override
  State<CommentsTextField> createState() => _CommentsTextFieldState();
}

class _CommentsTextFieldState extends State<CommentsTextField> {
  final TextEditingController _controller = TextEditingController();
  String? currentUserProfileImageUrl;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUserProfileImageUrl();
  }

  Future<void> _fetchCurrentUserProfileImageUrl() async {
    currentUserProfileImageUrl = await SharedPrefHelper.getString(SharedPrefKeys.profileImageUrl);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend(BuildContext context, CommentModel? replyingToComment) {
    if (_controller.text.isNotEmpty) {
      final cubit = context.read<CommentsCubit>();
      if (replyingToComment != null) {
        final request = CreateReplyRequest(content: _controller.text);
        cubit.createReply(request, replyingToComment.id, widget.postId);
      } else {
        final request = CreateCommentRequest(content: _controller.text);
        cubit.createComment(request, widget.postId);
      }
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsCubit, CommentsState>(
      listener: (context, state) {
        if (state is CommentsSuccess && state.replyingToComment == null) {
          _controller.clear();
        }
      },
      builder: (context, state) {
        final isLoading = state is CreateCommentLoading;
        final replyingToComment = state is CommentsSuccess ? state.replyingToComment : null;

        return Column(
          children: [
            const HorizontalDivider(),
            verticalSpace(10),
            if (replyingToComment != null)
              ReplyingToRow(
                engineerName: replyingToComment.engineerName ?? 'Unknown',
                onCancel: () => context.read<CommentsCubit>().setReplyingToComment(null),
              ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: CustomNetworkCachedAppProfilePic(
                    profileImageUrl: currentUserProfileImageUrl,
                    radius: 20,
                  ),
                ),
                horizontalSpace(6),
                Flexible(
                  child: AppTextFormField(
                    contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    controller: _controller,
                    hintText: replyingToComment != null
                        ? 'Reply to ${replyingToComment.engineerName}...'
                        : 'Write your comment here...',
                    hintStyle: TextStyles.font10lightBlackRegularWithOpacity,
                    backgroundColor: ColorsManager.white,
                    borderRadius: 40.r,
                    suffixIcon: GestureDetector(
                      onTap: isLoading ? null : () => _handleSend(context, replyingToComment),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : SvgPicture.asset('assets/svgs/upload_button.svg', fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}