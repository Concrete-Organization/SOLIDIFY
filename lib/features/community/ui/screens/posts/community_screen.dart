import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/community_app_bar.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/posts_bloc_builder.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(15),
            const CommunityAppBar(),
            verticalSpace(17),
            const HorizontalDivider(),
            verticalSpace(22),
            Expanded(child: PostsBlocBuilder()),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}