import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'full_screen_image_screen.dart';

class PostContent extends StatefulWidget {
  final String content;
  final List<String> imageUris;

  const PostContent({
    super.key,
    required this.content,
    required this.imageUris,
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  int _currentIndex = 0;
  bool _isExpanded = false;

  void _openFullScreenImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageScreen(
          imageUrls: widget.imageUris,
          initialIndex: _currentIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasValidImages = widget.imageUris.isNotEmpty &&
        widget.imageUris
            .any((uri) => Uri.tryParse(uri)?.hasAbsolutePath == true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final textSpan = TextSpan(
              text: widget.content,
              style: TextStyles.font12LightBlackRegular,
            );
            final textPainter = TextPainter(
              text: textSpan,
              maxLines: 3,
              textDirection: TextDirection.ltr,
            );
            textPainter.layout(maxWidth: constraints.maxWidth);
            final isTextOverflowing = textPainter.didExceedMaxLines;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.content,
                    style: TextStyles.font12LightBlackRegular,
                    maxLines: _isExpanded ? null : 3,
                    overflow: _isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                  if (isTextOverflowing)
                    Text(
                      _isExpanded ? "Less" : "See more...",
                      style: TextStyles.font12MainBlueSemiBold,
                    ),
                ],
              ),
            );
          },
        ),
        verticalSpace(9),
        if (hasValidImages)
          Column(
            children: [
              CarouselSlider(
                items: widget.imageUris.map((imageUri) {
                  return GestureDetector(
                    onTap: () => _openFullScreenImage(context),
                    child: CachedNetworkImage(
                      imageUrl: imageUri,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  scrollPhysics: widget.imageUris.length > 1
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              verticalSpace(10),
              if (widget.imageUris.length > 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imageUris.asMap().entries.map((entry) {
                    return Container(
                      width: 6.w,
                      height: 6.h,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? ColorsManager.mainBlue
                            : ColorsManager.mainBlueWith50Opacity,
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
      ],
    );
  }
}
