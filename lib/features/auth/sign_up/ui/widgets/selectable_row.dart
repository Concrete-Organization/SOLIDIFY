import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableRow extends StatefulWidget {
  final String iconPath;
  final String label;
  final String selectedIconPath;
  final Color defaultBorderColor;
  final Color selectedBorderColor;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final TextStyle textStyle;

  const SelectableRow({
    super.key,
    required this.iconPath,
    required this.label,
    required this.selectedIconPath,
    required this.defaultBorderColor,
    required this.selectedBorderColor,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
    required this.textStyle,
  });

  @override
  _SelectableRowState createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        width: 353,
        height: 65,
        decoration: BoxDecoration(
          color: _isSelected
              ? widget.selectedBackgroundColor
              : widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isSelected
                ? widget.selectedBorderColor
                : widget.defaultBorderColor,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.iconPath,
            ),
            const SizedBox(width: 10),
            Text(
              widget.label,
              style: widget.textStyle,
            ),
            const Spacer(),
            if (_isSelected)
              SvgPicture.asset(
                widget.selectedIconPath,
              ),
          ],
        ),
      ),
    );
  }
}
