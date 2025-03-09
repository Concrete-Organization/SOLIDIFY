import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CreatePostAppBar(onImagesSelected: updateSelectedImages),
          if (selectedImages.isNotEmpty)
            ImagesListViewPicker(
              selectedImages: selectedImages,
              onRemoveImage: removeImage,
            ),
          const Spacer(),
          AddCaptionPost(selectedImages: selectedImages),
        ],
      ),
    );
  }
}
