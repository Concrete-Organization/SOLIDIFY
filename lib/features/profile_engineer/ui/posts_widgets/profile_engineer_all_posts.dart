import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'profile_engineer_all_posts_bloc_builder.dart';

class ProfileEngineerAllPosts extends StatelessWidget {
  final String engineerId;

  const ProfileEngineerAllPosts({super.key, required this.engineerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<ProfileEngineerPostsCubit>()
          ..setEngineerId(engineerId)
          ..fetchEngineerPosts(),
        child: const ProfileEngineerAllPostsBlocBuilder(),
      ),
    );
  }
}