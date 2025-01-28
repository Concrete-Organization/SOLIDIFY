import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/widgets/upload_container.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_sign_up_cubit.dart';

import '../../../../widgets/sign_up_upload_files_screen.dart';

class BusinessIdentityAuthForm extends StatefulWidget {
  const BusinessIdentityAuthForm({super.key});

  @override
  State<BusinessIdentityAuthForm> createState() => _IdentityAuthFormState();
}

class _IdentityAuthFormState extends State<BusinessIdentityAuthForm> {
  String? commercialLicenseType;
  late BusinessAccountSignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<BusinessAccountSignUpCubit>();
  }

  Future<File> saveFileToTempDirectory(PlatformFile platformFile) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${platformFile.name}');
    return file.writeAsBytes(platformFile.bytes!);
  }

  void updateFileState(File file, String fileType) {
    setState(() {
      cubit.commercialLicenseFile = file;
      commercialLicenseType = fileType;
    });
  }

  Future<void> navigateToUploadScreen(bool isCV) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpUploadFilesScreen(),
      ),
    );

    if (result != null && result is Map<String, String>) {
      final fileName = result['name'];
      final fileType = result['extension'];

      if (fileName != null && fileType != null) {
        final file = File(fileName);
        if (await file.exists()) {
          updateFileState(
            file,
            fileType,
          );
        } else {
          print("File does not exist: $fileName");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.identityFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Name
          Text(
            'Company official name',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.companyNameController,
            hintText: 'Enter company name',
            validator: (value) =>
                value!.isEmpty ? 'Company name is required' : null,
          ),

          verticalSpace(18),

          Text(
            'Company address',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.addressController,
            hintText: 'Enter Company address',
            validator: (value) => value!.isEmpty ? 'Address is required' : null,
          ),

          verticalSpace(18),

          Text(
            'Commercial registration number',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.commercialNumberController,
            hintText: 'Enter Commercial registration number',
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),

          verticalSpace(18),
          Text(
            'Tax ID',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.taxIdController,
            hintText: 'Only 12 numbers',
            validator: (value) {
              if (value!.isEmpty) return 'Tax ID is required';
              if (value.length != 12) return 'Must be 12 digits';
              return null;
            },
          ),

          verticalSpace(18),
          Text(
            'Copy of the commercial license',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          GestureDetector(
            onTap: () => navigateToUploadScreen(true),
            child: UploadContainer(
              isUploaded: cubit.commercialLicenseFile != null,
              uploadedFileName:
                  cubit.commercialLicenseFile?.path.split('/').last,
              fileType: commercialLicenseType,
              onClose: () {
                setState(() {
                  cubit.commercialLicenseFile = null;
                  commercialLicenseType = null;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
