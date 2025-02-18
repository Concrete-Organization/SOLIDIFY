import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_response_model.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class ConcreteStrengthAiResult extends StatefulWidget {
  const ConcreteStrengthAiResult({super.key});

  @override
  State<ConcreteStrengthAiResult> createState() => _ConcreteStrengthAiResultState();
}

class _ConcreteStrengthAiResultState extends State<ConcreteStrengthAiResult> {
  double _concreteStrengthResult = 0.0;

  @override
  void initState() {
    super.initState();
    _loadConcreteStrengthResult();
  }

  Future<void> _loadConcreteStrengthResult() async {
    final resultJson = await SharedPrefHelper.getSurveyResult();
    if (resultJson != null && resultJson.isNotEmpty) {
      final Map<String, dynamic> jsonMap = jsonDecode(resultJson);
      final concreteStrengthResult = ConcreteAiResponseModel.fromJson(jsonMap);
      setState(() {
        _concreteStrengthResult = concreteStrengthResult.strength;
      });
    } else {
      debugPrint('No result found in SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Concrete Comprehensive\nStrength',
          style: TextStyles.font18MainSemiBold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(136),
            Stack(
              children: [
                SvgPicture.asset('assets/svgs/concrete_result.svg'),
                Positioned(
                  top: 60.h,
                  right: 35.w,
                  child: Column(
                    children: [
                      Text(
                        'Strength result:',
                        style: TextStyles.font15MainBlueMedium,
                      ),
                      verticalSpace(8),
                      Text(
                        _concreteStrengthResult.toStringAsFixed(3),
                        style: TextStyles.font20SecondaryGoldBold,
                      ),
                      verticalSpace(16),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppTextButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.companyLayout);
              },
              textButton: 'Done',
            ),
            verticalSpace(56),
          ],
        ),
      ),
    );
  }
}
