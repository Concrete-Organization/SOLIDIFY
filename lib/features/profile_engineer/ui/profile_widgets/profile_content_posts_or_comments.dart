import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/last_four_comments_for_the_user_bloc_builder.dart';
import 'package:solidify/features/profile_engineer/ui/posts_widgets/last_post_for_the_user_bloc_builder.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_engineer_change_listener.dart';

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
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ProfileEngineerChangeListener(),
        Expanded(
          child: IndexedStack(
            index: widget.currentTabIndex,
            children: [
              BlocProvider.value(
                value: context.read<ProfileEngineerPostsCubit>(),
                child: LastPostForTheUserBlocBuilder(
                  engineerId: widget.engineerId,
                ),
              ),
              BlocProvider.value(
                value: context.read<ProfileEngineerCommentsCubit>(),
                child: LastFourCommentsForTheUserBlocBuilder(
                  engineerId: widget.engineerId,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
