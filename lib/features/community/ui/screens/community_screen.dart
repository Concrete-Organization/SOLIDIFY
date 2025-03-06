import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/community/ui/widgets/community_app_bar.dart';
import 'package:solidify/features/community/ui/widgets/posts_bloc_builder.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          verticalSpace(15),
          CommunityAppBar(),
          verticalSpace(17),
          HorizontalDivider(),
          verticalSpace(22),
          const Expanded(
            child: PostsBlocBuilder(),
          ),
          verticalSpace(30),
        ],
      ),
    );
  }
}
