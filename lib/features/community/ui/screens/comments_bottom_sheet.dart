import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/community/ui/widgets/comments_list_view.dart';
import 'package:solidify/features/community/ui/widgets/comments_text_field.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsBottomSheet({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
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
                child: CommentsListView(scrollController: scrollController),
              ),
              const CommentsTextField(),
            ],
          ),
        );
      },
    );
  }
}