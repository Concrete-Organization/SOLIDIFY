import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';
import 'package:solidify/features/profile_engineer/ui/widgets/profile_engineer_name_and_image.dart';

class ProfileEngineerBlocBuilder extends StatelessWidget {
  const ProfileEngineerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerProfileCubit, EngineerProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (profile) => ProfileEngineerNameAndImage(
            engineerName: profile.model?.engineerName ?? 'Unknown',
            profileImageUrl: profile.model?.profileImageUrl,
          ),
          failure: (error) => ProfileEngineerNameAndImage(
            engineerName: 'Error loading profile',
          ),
          orElse: () => const ProfileEngineerNameAndImage(
            engineerName: 'Loading...',
          ),
        );
      },
    );
  }
}
