import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class PostContent extends StatelessWidget {
  final String content;
  final List<String> imageUris;

  const PostContent({
    super.key,
    required this.content,
    required this.imageUris,
  });

  @override
  Widget build(BuildContext context) {
    bool hasValidImage = imageUris.isNotEmpty &&
        imageUris.first.isNotEmpty &&
        Uri.tryParse(imageUris.first)?.hasAbsolutePath == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(content, style: TextStyles.font12LightBlackRegular),
        verticalSpace(9),
        if (hasValidImage)
          Image.network(
            imageUris.first,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}
