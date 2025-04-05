import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/helpers/jwt_helper.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account type',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: FutureBuilder<String?>(
        future: _getUserRole(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final currentRole = snapshot.data;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                _buildRoleTile(
                  role: 'Engineer',
                  currentRole: currentRole,
                  label: 'Engineer account',
                ),
                verticalSpace(16),
                HorizontalDivider(
                  color: ColorsManager.mainBlueWith2Opacity,
                  thickness: 0.6,
                ),
                verticalSpace(16),
                _buildRoleTile(
                  role: 'Company',
                  currentRole: currentRole,
                  label: 'Concrete company account',
                ),
                verticalSpace(16),
                HorizontalDivider(
                  color: ColorsManager.mainBlueWith2Opacity,
                  thickness: 0.6,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRoleTile({
    required String role,
    required String? currentRole,
    required String label,
  }) {
    final isActive = currentRole == role;
    return Text(
      label,
      style: isActive
          ? TextStyles.font15MainBlueMedium
          : TextStyles.font15lightBlackMedium,
    );
  }

  Future<String?> _getUserRole() async {
    final token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
    if (token.isEmpty) return null;
    return JwtHelper.getUserRole(token);
  }
}