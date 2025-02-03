import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/logic/engineer_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/widgets/upload_container.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/text_styles.dart';
import '../../../../widgets/sign_up_upload_files_screen.dart';

class EngineerIdentityAuthForm extends StatefulWidget {
  const EngineerIdentityAuthForm({super.key});

  @override
  State<EngineerIdentityAuthForm> createState() => _EngineerIdentityAuthState();
}

class _EngineerIdentityAuthState extends State<EngineerIdentityAuthForm> {
  String? syndicateFileType;
  String? cvFileType;
  late EngineerSignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EngineerSignUpCubit>();
  }

  Future<File> saveFileToTempDirectory(PlatformFile platformFile) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${platformFile.name}');
    return file.writeAsBytes(platformFile.bytes!);
  }

  void updateFileState(File file, String fileType, bool isCV) {
    setState(() {
      if (isCV) {
        cubit.cvFileName = file;
        cvFileType = fileType;
      } else {
        cubit.syndicateFileName = file;
        syndicateFileType = fileType;
      }
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
          updateFileState(file, fileType, isCV);
        }
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
            uploadedFileName: cubit.syndicateFileName?.path.split('/').last,
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