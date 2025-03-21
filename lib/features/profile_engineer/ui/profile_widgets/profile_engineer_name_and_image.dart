import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_network_cached_app_profile_pic.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/ui/profile_widgets/option_of_bottom_sheet_for_change_image.dart';

class ProfileEngineerNameAndImage extends StatelessWidget {
  final String engineerName;
  final String? profileImageUrl;
  final String engineerId;

  const ProfileEngineerNameAndImage({
    super.key,
    required this.engineerName,
    this.profileImageUrl,
    required this.engineerId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showImageSourceBottomSheet(context),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomNetworkCachedAppProfilePic(
                profileImageUrl: profileImageUrl,
                radius: 37.5,
              ),
              Positioned(
                bottom: -5,
                right: -10,
                child: Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.white,
                    border: Border.all(color: ColorsManager.mainBlue),
                  ),
                  child: SvgPicture.asset(
                    'assets/svgs/edit_icon.svg',
                    width: 15.w,
                    height: 15.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(13),
        Text(
          engineerName,
          style: TextStyles.font12MainBlueMedium,
        ),
      ],
    );
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    final cubit = context.read<EngineerProfileCubit>();
    showModalBottomSheet(
      backgroundColor: ColorsManager.white,
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsManager.mainBlue,
            width: 1.5,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OptionOfBottomSheetForChangeImage(
              icon: Icons.camera_alt,
              iconColor: ColorsManager.mainBlue,
              text: 'Take a Photo',
              onTap: () => cubit.handleCameraUpdate(engineerId, context),
            ),
            OptionOfBottomSheetForChangeImage(
              icon: Icons.photo_rounded,
              iconColor: ColorsManager.mainBlue,
              text: 'Choose existing Photo',
              onTap: () => cubit.handleGalleryUpdate(engineerId, context),
            ),
            OptionOfBottomSheetForChangeImage(
              icon: Icons.delete,
              iconColor: ColorsManager.red,
              text: 'Remove Background picture',
              onTap: () => cubit.handleRemoveImage(engineerId, context),
            ),
          ],
        ),
      ),
    );
  }
}
