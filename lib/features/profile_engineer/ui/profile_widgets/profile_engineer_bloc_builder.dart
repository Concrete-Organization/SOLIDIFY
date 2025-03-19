import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/profile_engineer_name_and_image.dart';

class ProfileEngineerBlocBuilder extends StatelessWidget {
  const ProfileEngineerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerProfileCubit, EngineerProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (engineerId, profile) => ProfileEngineerNameAndImage(
            engineerName: profile.model?.engineerName ?? 'Unknown',
            profileImageUrl: profile.model?.profileImageUrl,
            engineerId: engineerId,
          ),
          failure: (error) => ProfileEngineerNameAndImage(
            engineerName: 'Error loading profile',
            engineerId: '',
          ),
          orElse: () => const ProfileEngineerNameAndImage(
            engineerName: 'Loading...',
            engineerId: '',
          ),
        );
      },
    );
  }
}