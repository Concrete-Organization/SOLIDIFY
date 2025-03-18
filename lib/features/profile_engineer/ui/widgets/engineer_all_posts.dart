import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_posts/engineer_posts_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/engineer_posts_list.dart';

class EngineerAllPosts extends StatelessWidget {
  final String engineerId;

  const EngineerAllPosts({super.key, required this.engineerId});

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
        create: (context) =>
            getIt<EngineerPostsCubit>()..fetchEngineerPosts(engineerId),
        child: const EngineerPostsList(),
      ),
    );
  }
}
