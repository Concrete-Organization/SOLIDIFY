import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/chatbot/ui/screens/chatbot_screen.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/community/logic/posts/posts_state.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';
import 'package:solidify/features/community/logic/comments/comments_state.dart';
import 'package:solidify/features/community/ui/screens/posts/community_screen.dart';
import 'package:solidify/features/crack_detection/ui/screens/crack_detection_get_started.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/profile_engineer_screen.dart';

class EngineerLayout extends StatefulWidget {
  const EngineerLayout({super.key});

  @override
  State<EngineerLayout> createState() => _EngineerLayoutState();
}

class _EngineerLayoutState extends State<EngineerLayout> {
  late final PostsCubit postsCubit;
  late final EngineerProfileCubit profileCubit;
  late final ProfileEngineerPostsCubit profilePostsCubit;
  late final CommentsCubit commentsCubit;
  late final ProfileEngineerCommentsCubit profileCommentsCubit;

  @override
  void initState() {
    postsCubit = getIt<PostsCubit>();
    profileCubit = getIt<EngineerProfileCubit>();
    profilePostsCubit = getIt<ProfileEngineerPostsCubit>();
    commentsCubit = getIt<CommentsCubit>();
    profileCommentsCubit = getIt<ProfileEngineerCommentsCubit>();
    super.initState();
  }

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: postsCubit),
        BlocProvider.value(value: profileCubit),
        BlocProvider.value(value: profilePostsCubit),
        BlocProvider.value(value: commentsCubit),
        BlocProvider.value(value: profileCommentsCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PostsCubit, PostsState>(
            listener: (context, state) {
              if (state is CreatePostSuccess) {
                context.read<ProfileEngineerPostsCubit>().fetchEngineerPosts();
              }
            },
          ),
          BlocListener<CommentsCubit, CommentsState>(
            listener: (context, state) {
              if (state is CreateCommentSuccess) {
                context.read<ProfileEngineerCommentsCubit>().fetchEngineerComments(
                  context.read<ProfileEngineerCommentsCubit>().engineerId ?? '',
                );
              }
            },
          ),
        ],
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: [
              const CommunityScreen(),
              CrackDetectionGetStarted(),
              ChatbotScreen(),
              const ProfileEngineerScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorsManager.mainBlueWith5Opacity,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
              border: const Border(
                top: BorderSide(
                  color: ColorsManager.mainBlue,
                  width: .8,
                ),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: ColorsManager.secondaryGold,
              unselectedItemColor: ColorsManager.mainBlue,
              selectedLabelStyle: TextStyles.font13MainBlueMedium,
              unselectedLabelStyle: TextStyles.font13MainBlueMedium,
              onTap: onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/community_icon.svg',
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 0
                          ? ColorsManager.secondaryGold
                          : ColorsManager.mainBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/ai.svg',
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 1
                          ? ColorsManager.secondaryGold
                          : ColorsManager.mainBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Ai',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/chatbot_icon.svg',
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 2
                          ? ColorsManager.secondaryGold
                          : ColorsManager.mainBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Chatbot',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/profile_icon.svg',
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 3
                          ? ColorsManager.secondaryGold
                          : ColorsManager.mainBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}