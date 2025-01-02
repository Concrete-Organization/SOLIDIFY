import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/logic/engineer_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/upload_container.dart';
import '../engineer_sign_up_upload_files_screen.dart';

class EngineerIdentityAuth extends StatefulWidget {
  const EngineerIdentityAuth({super.key});

  @override
  State<EngineerIdentityAuth> createState() => _EngineerIdentityAuthState();
}

class _EngineerIdentityAuthState extends State<EngineerIdentityAuth> {
  String? syndicateFileType;
  String? cvFileType;
  late EngineerSignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EngineerSignUpCubit>();
  }

  void updateFileState(String fileName, String fileType, bool isCV) {
    setState(() {
      if (isCV) {
        cubit.cvFileName = File(fileName);
        cvFileType = fileType;
      } else {
        cubit.syndicateFileName = File(fileName);
        syndicateFileType = fileType;
      }
    });
  }
  Future<void> navigateToUploadScreen(bool isCV) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EngineerSignUpUploadFilesScreen(),
      ),
    );

    if (result != null && result is Map<String, String>) {
      final fileName = result['name'];
      final fileType = result['extension'];

      if (fileName != null && fileType != null) {
        updateFileState(fileName, fileType, isCV);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Identity authentication',
          style: TextStyles.font24MainBlueSemiBold,
        ),
        verticalSpace(50),
        Text(
          'Upload your engineers syndicate card',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(5),
        GestureDetector(
          onTap: () => navigateToUploadScreen(false),
          child: UploadContainer(
            isUploaded: cubit.syndicateFileName != null,
            uploadedFileName: cubit.syndicateFileName?.path.split('/').last,  // Get filename from path
            fileType: syndicateFileType,
            onClose: () {
              setState(() {
                cubit.syndicateFileName = null;
                syndicateFileType = null;
              });
            },
          ),
        ),
        verticalSpace(25),
        Text(
          'Upload your CV',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(5),
        GestureDetector(
          onTap: () => navigateToUploadScreen(true),
          child: UploadContainer(
            isUploaded: cubit.cvFileName != null,
            uploadedFileName: cubit.cvFileName?.path.split('/').last,
            fileType: cvFileType,
            onClose: () {
              setState(() {
                cubit.cvFileName = null;
                cvFileType = null;
              });
            },
          ),
        ),
      ],
    );
  }
}
