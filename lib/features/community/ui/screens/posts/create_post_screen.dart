import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/add_caption_post.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/create_post_app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CreatePostAppBar(onImagesSelected: updateSelectedImages),
          const Spacer(),
          AddCaptionPost(selectedImages: selectedImages),
        ],
      ),
    );
  }
}
