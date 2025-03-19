import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/custom_tab_toggle.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_content_posts_or_comments.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_engineer_app_bar.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_engineer_bloc_builder.dart';

import '../../../core/di/dependency_injection.dart';
import '../logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import '../logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';

class ProfileEngineerScreen extends StatefulWidget {
  const ProfileEngineerScreen({super.key});

  @override
  State<ProfileEngineerScreen> createState() => _ProfileEngineerScreenState();
}

class _ProfileEngineerScreenState extends State<ProfileEngineerScreen> {
  int _currentTabIndex = 0;
  String _userId = '';

  @override
  void initState() {
    super.initState();
    _loadEngineerProfile();
  }

  Future<void> _loadEngineerProfile() async {
    final userDetails = await SharedPrefHelper.getUserDetails();
    setState(() {
      _userId = userDetails['userId'] ?? '';
    });
    if (_userId.isNotEmpty) {
      context.read<EngineerProfileCubit>().fetchEngineerProfile(_userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ProfileEngineerAppBar(),
            verticalSpace(13),
            HorizontalDivider(
              thickness: 0.5,
            ),
            verticalSpace(28),
            ProfileEngineerBlocBuilder(),
            verticalSpace(21),
            CustomTabToggle(
              tabs: const ['Posts', 'Comments'],
              onTabSelected: (index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
            ),
            verticalSpace(21),
            HorizontalDivider(
              thickness: 0.2,
            ),
            verticalSpace(16),
            if (_userId.isNotEmpty)
              Expanded(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => getIt<ProfileEngineerPostsCubit>()
                    ),
                    BlocProvider(
                        create: (context) => getIt<ProfileEngineerCommentsCubit>()
                    ),
                  ],
                  child: ProfileContentPostsOrComments(
                    currentTabIndex: _currentTabIndex,
                    engineerId: _userId,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}