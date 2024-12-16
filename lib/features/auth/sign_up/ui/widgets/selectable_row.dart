import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableRowWithCheck extends StatefulWidget {
  final String iconPath; // First icon path (dynamic)
  final String label; // Text (dynamic)

  const SelectableRowWithCheck({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  _SelectableRowWithCheckState createState() => _SelectableRowWithCheckState();
}

class _SelectableRowWithCheckState extends State<SelectableRowWithCheck> {
  bool _isSelected = false;

  // Constants
  static const String _checkIconPath = "assets/svgs/selected_check_icon.svg";
  static const Color _defaultBorderColor = ColorsManager.mainBlue;
  static const Color _selectedBorderColor = ColorsManager.secondaryGold;
  static final Color _defaultBackgroundColor =
      ColorsManager.mainBlueWith15Opacity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        width: 353.w,
        height: 65.h,
        decoration: BoxDecoration(
          color: _defaultBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _isSelected ? _selectedBorderColor : _defaultBorderColor,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.iconPath, // Dynamic icon
            ),
            const SizedBox(width: 10),
            Text(
              widget.label, // Dynamic text
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (_isSelected)
              SvgPicture.asset(
                _checkIconPath, // Constant check icon
              ),
          ],
        ),
      ),
    );
  }
}
