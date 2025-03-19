import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/comments_widgets/profile_engineer_all_comments_bloc_builder.dart';

class ProfileEngineerAllComments extends StatelessWidget {
  final String engineerId;

  const ProfileEngineerAllComments({super.key, required this.engineerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<ProfileEngineerCommentsCubit>()
          ..fetchEngineerComments(
            engineerId,
          ),
        child: const ProfileEngineerAllCommentsBlocBuilder(),
      ),
    );
  }
}