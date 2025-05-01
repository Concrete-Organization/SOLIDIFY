import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_account_sign_up_state.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_sign_up_cubit.dart';

class ConcreteCompanyAccountBlocListener extends StatelessWidget {
  const ConcreteCompanyAccountBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConcreteCompanySignUpCubit, ConcreteCompanyAccountSignUpState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          concreteCompanySignUpLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => LoadingCircleIndicator(),
            );
          },
          concreteCompanySignUpSuccess: (response) {
            Navigator.of(context).pop();
            context.pushNamedAndRemoveUntil(
              Routes.companyLayout,
              predicate: (Route<dynamic> route) => false,
            );
          },
          concreteCompanySignUpError: (error) {
            Navigator.of(context).pop();
            CustomSnackBar.showError(
              context,
              error.getAllErrorMessages(),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
