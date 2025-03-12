import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/features/community/data/models/post_models/create_post_request.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';

class AddCaptionPost extends StatelessWidget {
  final List<XFile> selectedImages;
  final TextEditingController captionController;

  const AddCaptionPost({
    super.key,
    required this.selectedImages,
    required this.captionController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith5Opacity,
        border: Border.all(color: ColorsManager.mainBlue),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: AppTextFormField(
                controller: captionController,
                hintText: 'Add caption......',
                hintStyle: TextStyles.font14lightBlackLight,
                backgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                maxLines: 100,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                final isLoading = state == const PostsState.createPostLoading();
                return AppTextButton(
                  isLoading: isLoading,
                  onPressed: () {
                    final content = captionController.text;
                    if (content.isNotEmpty || selectedImages.isNotEmpty) {
                      final request = CreatePostRequest(
                        content: content,
                        imageUris: selectedImages.isNotEmpty
                            ? selectedImages.map((x) => File(x.path)).toList()
                            : null,
                      );
                      context.read<PostsCubit>().createPost(request);
                    } else {
                      CustomSnackBar.showError(
                        context,
                        'Please add a caption or select images',
                      );
                    }
                  },
                  textButton: 'Post',
                );
              },
            ),
          ),
          verticalSpace(48),
        ],
      ),
    );
  }
}
