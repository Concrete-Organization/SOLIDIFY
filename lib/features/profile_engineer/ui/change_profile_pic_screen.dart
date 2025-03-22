import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_network_cached_app_profile_pic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';

class ChangeProfilePicScreen extends StatefulWidget {
  final String? currentImageUrl;
  final String engineerId;

  const ChangeProfilePicScreen({
    super.key,
    this.currentImageUrl,
    required this.engineerId,
  });

  @override
  State<ChangeProfilePicScreen> createState() => _ChangeProfilePicScreenState();
}

class _ChangeProfilePicScreenState extends State<ChangeProfilePicScreen> {
  File? _selectedImage;
  bool _isUpdating = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: ColorsManager.mainBlue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            showCropGrid: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: true,
            showCancelConfirmationDialog: true,
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _selectedImage = File(croppedFile.path);
        });
      }
    }
  }

  Future<void> _saveImage() async {
    if (_selectedImage == null) return;

    setState(() {
      _isUpdating = true;
    });

    final cubit = BlocProvider.of<EngineerProfileCubit>(context);
    await cubit.updateEngineerProfile(widget.engineerId, _selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EngineerProfileCubit, EngineerProfileState>(
      listener: (context, state) {
        if (_isUpdating) {
          state.maybeWhen(
            loading: () {},
            success: (engineerId, profile) {
              setState(() {
                _isUpdating = false;
              });
              context.read<EngineerProfileCubit>().fetchEngineerProfile(engineerId);
              Navigator.pop(context);
            },
            failure: (error) {
              setState(() {
                _isUpdating = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.getAllErrorMessages())),
              );
            },
            orElse: () {},
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Change Profile Picture',
            style: TextStyles.font18MainBlueSemiBold,
          ),
        ),
        body: GestureDetector(
          onTap: _pickImage,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                verticalSpace(135),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 402.h,
                      decoration: BoxDecoration(
                        image: _selectedImage != null
                            ? DecorationImage(
                          image: FileImage(_selectedImage!),
                          fit: BoxFit.cover,
                        )
                            : widget.currentImageUrl != null
                            ? DecorationImage(
                          image: CachedNetworkImageProvider(
                            widget.currentImageUrl!,
                          ),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                        child: Container(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    _selectedImage != null
                        ? CircleAvatar(
                      radius: 171,
                      backgroundImage: FileImage(_selectedImage!),
                    )
                        : CustomNetworkCachedAppProfilePic(
                      profileImageUrl: widget.currentImageUrl,
                      radius: 171,
                    ),
                  ],
                ),
                verticalSpace(80),
                AppTextButton(
                  onPressed: _saveImage,
                  textButton: 'Save',
                  isLoading: _isUpdating,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}