import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../data/models/verify_otp_request_model.dart';
import '../../logic/verify_otp_cubit.dart';
import 'otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_updateOtp);
    }
  }

  void _updateOtp() {
    final otp = _controllers.map((c) => c.text).join();
    context.read<VerifyOtpCubit>().enteredOtp = otp;
  }

  void _nextField({required String value, required int index}) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  void _verifyOtp() async {
    bool isValid = true;

    for (var controller in _controllers) {
      if (controller.text.length != 1) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      final otp = _controllers.map((c) => c.text).join();
      final email = await SharedPrefHelper.getEmail();
      final requestModel = VerifyOtpRequestModel(email: email, otp: otp,);
      await SharedPrefHelper.setSecuredString('otp', otp);
      BlocProvider.of<VerifyOtpCubit>(context).verifyOtp(requestModel);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorsManager.mainBlue,
          content: Text(
            'Please enter the complete OTP code',
            textAlign: TextAlign.center,
            style: TextStyles.font16WhiteMedium.copyWith(fontSize: 14),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return OtpTextField(
              index: index,
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              onChanged: (value) => _nextField(value: value, index: index),
            );
          }),
        ),
        const Spacer(),
        AppTextButton(
          onPressed: _verifyOtp,
          textButton: 'Continue',
        ),
        verticalSpace(20),
      ],
    );
  }
}