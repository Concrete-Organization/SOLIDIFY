import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class CommentsTextField extends StatefulWidget {
  const CommentsTextField({super.key});

  @override
  State<CommentsTextField> createState() => _CommentsTextFieldState();
}

class _CommentsTextFieldState extends State<CommentsTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 19.w,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 18.w,
              backgroundImage: AssetImage('assets/images/app_prof.png'),
            ),
          ),
          horizontalSpace(6),
          Flexible(
            child: AppTextFormField(
              controller: _controller,
              backgroundColor: ColorsManager.white,
              borderRadius: 40.r,
              suffixIcon: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svgs/upload_button.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
