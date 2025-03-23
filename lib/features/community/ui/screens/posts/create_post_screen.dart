import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/add_caption_post.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/create_post_app_bar.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/images_list_view_picker.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  List<XFile> selectedImages = [];
  final TextEditingController _captionController = TextEditingController();

  void updateSelectedImages(List<XFile> images) {
    setState(() {
      selectedImages = images;
    });
  }

  void removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsCubit, PostsState>(
      listener: (context, state) {
        state.whenOrNull(
          createPostSuccess: (response) {
            context.read<PostsCubit>().loadPosts();
            Navigator.pop(context);
          },
          createPostError: (error) {
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            CreatePostAppBar(onImagesSelected: updateSelectedImages),
            if (selectedImages.isNotEmpty)
              ImagesListViewPicker(
                selectedImages: selectedImages,
                onRemoveImage: removeImage,
              ),
            if (selectedImages.isEmpty)
              verticalSpace(MediaQuery.of(context).size.height*0.2),
            Expanded(
              child: AddCaptionPost(
                selectedImages: selectedImages,
                captionController: _captionController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}