import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_cubit.dart';
import 'engineer_posts_list.dart';

class ProfileContentSection extends StatefulWidget {
  final int currentTabIndex;
  final String engineerId;

  const ProfileContentSection({
    super.key,
    required this.currentTabIndex,
    required this.engineerId,
  });

  @override
  State<ProfileContentSection> createState() => _ProfileContentSectionState();
}

class _ProfileContentSectionState extends State<ProfileContentSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.currentTabIndex == 0
          ? BlocProvider(
        create: (context) => getIt<EngineerPostsCubit>()..fetchEngineerPosts(widget.engineerId),
        child: const EngineerPostsList(),
      )
          : Center(
        child: Text(
          'Comments section coming soon',
          style: TextStyles.font15MainBlueMedium,
        ),
      ),
    );
  }
}