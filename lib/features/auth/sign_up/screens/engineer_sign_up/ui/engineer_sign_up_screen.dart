import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/engineer_account_sign_up_forms_list.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/engineer_sign_up_bloc_listener.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/engineer_sign_up_page_view_builder.dart';
import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../logic/engineer_sign_up_cubit.dart';

class EngineerSignUpScreen extends StatefulWidget {
  const EngineerSignUpScreen({super.key});

  @override
  State<EngineerSignUpScreen> createState() =>
      _EngineerAccountSignUpScreenState();
}

class _EngineerAccountSignUpScreenState extends State<EngineerSignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  late EngineerSignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EngineerSignUpCubit>();
  }

  void _onNextPage() {
    final cubit = context.read<EngineerSignUpCubit>();

    switch (currentPage) {
      case 0:
        if (!cubit.userAndEmailFormKey.currentState!.validate()) return;
        break;
      case 1:
        if (!cubit.passwordFormKey.currentState!.validate()) return;
        break;
      case 2:
        final syndicateFileUploaded = cubit.syndicateFileName != null;
        final cvFileUploaded = cubit.cvFileName != null;

        if (!syndicateFileUploaded || !cvFileUploaded) {
          CustomSnackBar.showError(
            context,
            'Please upload both syndicate card and CV files.',
          );
          return;
        }
        break;
    }

    if (currentPage < engineerAccountSignUpFormsScreensList.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() => currentPage++);
    } else {
      cubit.emitEngineerSignupStates();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              CustomAppBarWithIndicator(
                currentIndex: currentPage,
                totalPages: engineerAccountSignUpFormsScreensList.length,
              ),
              verticalSpace(40),
              Expanded(
                child: EngineerSignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              verticalSpace(20),
              AppTextButton(
                onPressed: _onNextPage,
                textButton:
                    currentPage == engineerAccountSignUpFormsScreensList.length - 1
                        ? 'Done'
                        : 'Continue',
              ),
              verticalSpace(20),
              const EngineerSignUpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
