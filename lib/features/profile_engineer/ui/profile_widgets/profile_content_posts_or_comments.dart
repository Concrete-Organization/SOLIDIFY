import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/last_four_comments_for_the_user_bloc_builder.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/last_post_for_the_user_bloc_builder.dart';

class ProfileContentPostsOrComments extends StatefulWidget {
  final int currentTabIndex;
  final String engineerId;

  const ProfileContentPostsOrComments({
    super.key,
    required this.currentTabIndex,
    required this.engineerId,
  });

  @override
  State<ProfileContentPostsOrComments> createState() =>
      _ProfileContentPostsOrCommentsState();
}

class _ProfileContentPostsOrCommentsState
    extends State<ProfileContentPostsOrComments>
    with AutomaticKeepAliveClientMixin {
  late final ProfileEngineerPostsCubit profileEngineerPostsCubit;
  late final ProfileEngineerCommentsCubit profileEngineerCommentsCubit;

  @override
  void initState() {
    super.initState();
    profileEngineerPostsCubit = getIt<ProfileEngineerPostsCubit>()
      ..fetchEngineerPosts(widget.engineerId);
    profileEngineerCommentsCubit = getIt<ProfileEngineerCommentsCubit>()
      ..fetchEngineerComments(widget.engineerId);
  }

  @override
  void dispose() {
    profileEngineerPostsCubit.close();
    profileEngineerCommentsCubit.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IndexedStack(
      index: widget.currentTabIndex,
      children: [
        BlocProvider.value(
          value: profileEngineerPostsCubit,
          child: LastPostForTheUserBlocBuilder(
            engineerId: widget.engineerId,
          ),
        ),
        BlocProvider.value(
          value: profileEngineerCommentsCubit,
          child: LastFourCommentsForTheUserBlocBuilder(
            engineerId: widget.engineerId,
          ),
        ),
      ],
    );
  }
}
