import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:solidify/features/auth/reset_password/logic/reset_password_state.dart';
import 'package:solidify/features/auth/reset_password/ui/widgets/reset_password_bloc_listener.dart';
import 'package:solidify/features/auth/reset_password/ui/widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loadingStoredData: () => const Center(child: CircularProgressIndicator()),
                storedDataLoaded: (isPasswordHidden, isConfirmPasswordHidden) =>
                    _buildContent(isPasswordHidden, isConfirmPasswordHidden),
                resetPasswordLoading: () => _buildContent(
                  context.read<ResetPasswordCubit>().isPasswordHidden,
                  context.read<ResetPasswordCubit>().isConfirmPasswordHidden,
                ),
                resetPasswordSuccess: () => const SizedBox.shrink(),
                error: (error) => Center(child: Text(error.getAllErrorMessages())),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(bool isPasswordHidden, bool isConfirmPasswordHidden) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20),
        const CustomAppBarWithIndicator(
          currentIndex: 2,
          totalPages: 3,
        ),
        verticalSpace(40),
        Text(
          'Reset password',
          style: TextStyles.font24MainBlueMedium,
        ),
        verticalSpace(6),
        Text(
          'Secure your account with new password',
          style: TextStyles.font12lightBlackLight,
        ),
        verticalSpace(16),
        Expanded(
          child: ResetPasswordForm(
            isPasswordHidden: isPasswordHidden,
            isConfirmPasswordHidden: isConfirmPasswordHidden,
          ),
        ),
        const ResetPasswordBlocListener(),
      ],
    );
  }
}