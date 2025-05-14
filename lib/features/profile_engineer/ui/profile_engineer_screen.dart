import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/custom_profile_drawer.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/profile_top_bar.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/core/widgets/custom_tab_toggle.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_content_posts_or_comments.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_engineer_bloc_builder.dart';

class ProfileEngineerScreen extends StatefulWidget {
  const ProfileEngineerScreen({super.key});

  @override
  State<ProfileEngineerScreen> createState() => _ProfileEngineerScreenState();
}

class _ProfileEngineerScreenState extends State<ProfileEngineerScreen> {
  int _currentTabIndex = 0;
  String _userId = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _loadEngineerProfile(context);
  }

  Future<void> _loadEngineerProfile(BuildContext context) async {
    final userDetails = await SharedPrefHelper.getUserDetails();
    setState(() {
      _userId = userDetails['userId'] ?? '';
    });
    if (_userId.isNotEmpty) {
      if (context.mounted) {
        context.read<EngineerProfileCubit>().fetchEngineerProfile(_userId);
        context.read<ProfileEngineerPostsCubit>().setEngineerId(_userId);
        context.read<ProfileEngineerPostsCubit>().fetchEngineerPosts();
        context.read<ProfileEngineerCommentsCubit>().fetchEngineerComments(_userId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomProfileDrawer(),
        onDrawerChanged: (isOpen) {
          setState(() {
            _isDrawerOpen = isOpen;
          });
        },
        drawerScrimColor: Colors.transparent,
        body: Column(
          children: [
            verticalSpace(13),
            ProfileTopBar(scaffoldKey: _scaffoldKey),
            verticalSpace(13),
            HorizontalDivider(thickness: 0.5),
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
            HorizontalDivider(thickness: 0.2),
            verticalSpace(16),
            if (_userId.isNotEmpty)
              Expanded(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: context.read<ProfileEngineerPostsCubit>(),
                    ),
                    BlocProvider.value(
                      value: context.read<ProfileEngineerCommentsCubit>(),
                    ),
                  ],
                  child: ProfileContentPostsOrComments(
                    currentTabIndex: _currentTabIndex,
                    engineerId: _userId,
                  ),
                ),
              ),
            if (_isDrawerOpen)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withValues(alpha: 0.2)),
              ),
          ],
        ),
      ),
    );
  }
}